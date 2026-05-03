#!/usr/bin/env bash

shopt -s nullglob
shopt -s extglob

set -e -o pipefail

# This script will install my favorite tools. It is meant to use on
# primary workstations but not necessarily on a server.

DNF_PACKAGES=(
    'bat'
    'direnv'
    'fd'
    'fontconfig'
    'fzf'
    'git'
    'gh'
    'gron'
    'httpie'
    'mise'
    'prettyping'
    'restic'
    'tig'
    'tldr'
    'util-linux'
    'vim'
    'wget'
    'which'
    'zoxide'
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
sudo dnf copr enable jdxcode/mise
sudo dnf -y install --skip-unavailable "${DNF_PACKAGES[@]}"
end_group

# Install zsh and make it the standard shell
if ! command -v zsh &>/dev/null; then
    start_group "Installing zsh ..."
    sudo dnf install -y zsh
    chsh -s "$(which zsh)"
    end_group
fi

start_group "Installing global dev tools using mise"
mise use --global go
mise use --global go:github.com/fraugster/cwtch
end_group

if [[ ! -d ~/.asdf ]]; then
    start_group "Installing asdf (a tool version manager)"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$ASDF_VERSION"
    end_group
fi

# Make sure fonts are installed correctly
# The installation itself is managed via chezmoi
start_group "Ensuring fonts are installed"
fc-cache -f
fc-list | grep FiraCodeNerdFont
end_group

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
    start_group "Install vundle (plugin manager for vim)"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    end_group
fi
