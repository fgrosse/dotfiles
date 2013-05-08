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

# copy xfce4-terminal configuration (if it is installed)
if [ -d ~/.config/xfce4/terminal/ ]; then
	echo "Found xfce4-terminal config folder. Copying terminalrc.."
	rm -f ~/.config/xfce4/terminal/terminalrc
	ln -s $DIR/xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc
fi

echo "Setting up git.."
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig

echo "Setting up vim.."
rm -f ~/.vimrc
ln -s $DIR/vimrc ~/.vimrc

echo "Dotfile setup has finished"

