.PHONY: all git symlink update clean

all: git symlink ~/.rbenv ~/.vim/bundle/Vundle.vim

git:
	git submodule init
	git submodule update

symlink:
	@./setup symlinks

~/.rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@./setup unlink
