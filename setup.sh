#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up git"
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/git-completion.sh ~/.git-completion.sh
echo "Dotfile setup has finished"

