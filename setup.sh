#!/usr/bin/env bash

set -e -o pipefail

type git >/dev/null 2>&1 || { echo >&2 'ERROR: Script requires "git" binary to fetch the dotfiles repository.'; exit 1; }
type make >/dev/null 2>&1 || { echo >&2 'ERROR: Script requires "make" binary to perform post setup steps.'; exit 1; }

REPO='https://github.com/fgrosse/dotfiles.git'
CHEZMOI_VERSION='2.64.0'
CHEZMOI_SHA256_HASH='fd16ca5c87310c721064bc54751a0d0be6a8721479f2e2ae92c820dd8faef13f'

function print_step {
    MSG="$1"
    echo -e "\n\e[97m### \e[1m${MSG}\e[0m"
}

if [[ ! -x "$(which chezmoi 2> /dev/null)" ]]; then
    type wget >/dev/null 2>&1 || { echo >&2 'ERROR: Script requires "wget" binary to download chezmoi.'; exit 1; }
    type tar >/dev/null 2>&1 || { echo >&2 'ERROR: Script requires "tar" binary to decompress the downloaded archive.'; exit 1; }
    type sha256sum >/dev/null 2>&1 || { echo >&2 'ERROR: Script requires "sha256sum" binary to validate the checksum of the decompressed binary.'; exit 1; }

    CHEZMOI_TARGET=/usr/local/bin/chezmoi
    CHEZMOI_TAR_FILE="chezmoi_${CHEZMOI_VERSION}_linux_amd64.tar.gz"
    CHEZMOI_DOWNLOAD_URL="https://github.com/twpayne/chezmoi/releases/download/v$CHEZMOI_VERSION/$CHEZMOI_TAR_FILE"

    print_step "Did not find \"chezmoi\" binary in \$PATH. Downloading from GitHub..."
    echo "URL: $CHEZMOI_DOWNLOAD_URL"
    wget "$CHEZMOI_DOWNLOAD_URL"

    print_step "Decompressing archive and validating checksum ..."
    echo "Expected: $CHEZMOI_SHA256_HASH"
    echo "$CHEZMOI_SHA256_HASH  $CHEZMOI_TAR_FILE" | sha256sum -c -
    tar -C /tmp/ -xzf "$CHEZMOI_TAR_FILE" chezmoi

    print_step "Installing chezmoi"
    echo "Target: $CHEZMOI_TARGET"
    if [[ $EUID -eq 0 ]]; then
        # Script is running as root already (maybe on a server?)
        install /tmp/chezmoi "$CHEZMOI_TARGET"
    else
        sudo install /tmp/chezmoi "$CHEZMOI_TARGET"
    fi

    print_step "Cleaning up downloaded files ..."
    echo "rm $CHEZMOI_TAR_FILE" /tmp/chezmoi
    rm "$CHEZMOI_TAR_FILE" /tmp/chezmoi
else
    print_step "Detected chezmoi installation"
    echo "Path: $(which chezmoi)"
fi

print_step "# Initializing dotfiles from $REPO"
echo "chezmoi init --apply \"$REPO\""
chezmoi init --apply "$REPO"

print_step "Dotfiles setup successful."
echo "You may install additional tools via setup-tools.sh"
echo "Please restart your shell to apply the new settings."
echo "Happy hacking! \ʕ◔ϖ◔ʔ/"
echo
