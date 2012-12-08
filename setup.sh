#! /bin/bash

echo "Starting dotfiles setup"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up .bashrc.."
rm -f ~/.bashrc
ln -s $DIR/bashrc ~/.bashrc
rm -f ~/.bash_aliases
ln -s $DIR/bash_aliases ~/.bash_aliases
rm -f ~/.bash_profile
ln -s $DIR/bash_profile ~/.bash_profile

if [ ! -f ~/.bash_local ]; then
	echo "Created a new file '~/.bash_local'. You can put your system specific configurations (like alternative PATH) in there"
	cp $DIR/bash_local ~/.bash_local
else
	echo "Did not overwrite existing ~/.bash_local"
fi

echo "Setting up git.."
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig

echo "Dotfile setup has finished"

