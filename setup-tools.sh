#!/usr/bin/env bash

set -e -o pipefail

# This script will install my favorite tools. It is meant to use on
# primary workstations but not necessarily on a server.

GO_VERSION='1.23.1'
GO_SHA256_HASH='49bbb517cfa9eee677e1e7897f7cf9cfdbcf49e05f61984a2789136de359f9bd'

ASDF_VERSION='v0.13.1'

DNF_PACKAGES=(
    'bat'
    'direnv'
    'fzf'
    'gron'
    'httpie'
    'prettyping'
    'tldr'
    'util-linux'
    'wget'
    'which'
    'zoxide'
    'gh'
)

GO_TOOLS=(
    'github.com/fraugster/cwtch@latest'
)

start_group() {
    echo -e "\n\e[97m### \e[1m$*\e[0m"
    { set -x; return; } 2>/dev/null
}

end_group() {
    { set +x; return; } 2>/dev/null
}

start_group "Updating packages"
sudo dnf -y update
end_group

start_group "Installing packages"
sudo dnf -y install "${DNF_PACKAGES[@]}"
end_group

# Install zsh and make it the standard shell
if ! command -v zsh &>/dev/null; then
    start_group "Installing zsh ..."
    sudo dnf install -y zsh
    chsh -s "$(which zsh)"
    end_group
fi

GO_TARGET=/usr/local/go
install_go() {
    GO_TAR_FILE="go$GO_VERSION.linux-amd64.tar.gz"
    GO_DOWNLOAD_URL="https://go.dev/dl/$GO_TAR_FILE"

    start_group ">> Downloading Go $GO_VERSION ..."
    echo "   URL: $GO_DOWNLOAD_URL"
    wget "$GO_DOWNLOAD_URL"
    end_group

    start_group ">> Validating checksum ..."
    echo "   Expected: $GO_SHA256_HASH"
    echo "$GO_SHA256_HASH  $GO_TAR_FILE" | sha256sum -c -
    end_group

    start_group ">> Removing previous Go installation ..."
    echo "   Path: $GO_TARGET"
    rm -rf /usr/local/go
    end_group

    start_group ">> Decompressing archive ..."
    tar -C "$(dirname $GO_TARGET)" -xzf "$GO_TAR_FILE"
    end_group

    start_group ">> Cleaning up downloaded files ..."
    rm "$GO_TAR_FILE"
    end_group

    start_group ">> Testing Go installation ..."
    export PATH=/usr/local/go/bin:$PATH
    go version
    end_group
}

if [[ ! -d "$GO_TARGET" ]]; then
    echo "Installing Go v$GO_VERSION ..."
    install_go
fi

# Install tools with Go install
for tool in "${GO_TOOLS[@]}"; do
    start_group "Installing $tool ..."
    go install "$tool"
    end_group
done

if [[ ! -d ~/.asdf ]]; then
    echo "Installing asdf (a tool version manager)"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$ASDF_VERSION"
fi
