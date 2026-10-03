#!/bin/bash

set -e -o pipefail

# Installs https://github.com/nvie/git-toolbelt from a clone, as described in
# its README. "make link" symlinks every git-* command into ~/.local/bin.

REPO='https://github.com/nvie/git-toolbelt.git'
TARGET="$HOME/src/git-toolbelt"

echo -e "\n\e[97m### \e[1mInstalling git-toolbelt from $TARGET\e[0m"

if ! type make >/dev/null 2>&1; then
    echo "Skipping git-toolbelt setup because 'make' executable is not available"
    exit 0
fi

if [[ ! -d "$TARGET" ]]; then
    mkdir -p "$(dirname "$TARGET")"
    echo "Cloning $REPO"
    git clone "$REPO" "$TARGET"
fi

make --no-print-directory -C "$TARGET" link
