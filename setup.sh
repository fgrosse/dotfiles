#! /bin/bash

echo "Starting dotfiles setup"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up .bashrc.."
rm -f ~/.bashrc
ln -s $DIR/bashrc ~/.bashrc
rm -f ~/.bash_aliases
ln -s $DIR/bash_aliases ~/.bash_aliases

echo "Setting up git.."
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig

echo "Dotfile setup has finished"

