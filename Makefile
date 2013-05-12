all: git symlink

git:
	git submodule init
	git submodule update

symlink:
	@./setup symlinks

update: git
	git submodule foreach 'git checkout master && git pull'
	git commit --all --edit --message 'update git submodules'

clean:
	@./setup unlink
