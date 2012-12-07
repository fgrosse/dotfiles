#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up git"
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig

