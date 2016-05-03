.PHONY: all git symlink update clean

all: git symlink ~/.rbenv

git:
	git submodule init
	git submodule update

symlink:
	@./setup symlinks

~/.rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@./setup unlink
