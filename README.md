Description
===========

This is a collection of my application and system settings that are stored in hidden dotfiles.

Installation
============

Clone this repository into ~/.dotfiles and run ~/.dotfiles/setup.sh

```
$ cd ~
$ git clone https://github.com/FGrosse/dotfiles.git .dotfiles
$ cd .dotfiles
$ make
Creating symlinks to .dotfiles..
File already exists: /home/friedrich/.gitconfig, What do you want to do?
[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all
B
Creating backup (/home/friedrich/.gitconfig.bak)..
File already exists: /home/friedrich/.gitignore - Creating backup (/home/friedrich/.gitignore.bak)..
File already exists: /home/friedrich/.zshenv - Creating backup (/home/friedrich/.zshenv.bak)..
File already exists: /home/friedrich/.zshrc - Creating backup (/home/friedrich/.zshrc.bak)..
Script finished. Have a nice day :)
```

Removal
=======

The dotfile links can also be removed and the backups will be restored.

```
$ cd ~/.dotfiles
$ make clean
Removing /home/friedrich/.gitconfig..
Restoring backup /home/friedrich/.gitconfig.bak
Removing /home/friedrich/.gitignore..
Restoring backup /home/friedrich/.gitignore.bak
Removing /home/friedrich/.zshenv..
Restoring backup /home/friedrich/.zshenv.bak
Removing /home/friedrich/.zshrc..
Restoring backup /home/friedrich/.zshrc.bak
```
