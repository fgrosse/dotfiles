SHELL = /bin/zsh

.PHONY: setup test debug test-build git-set-url

test: test-build
	docker run -it --rm chezmoi-test

debug: test-build
	docker run -it --rm chezmoi-test zsh

test-build:
	docker build -t chezmoi-test -f ./test/Dockerfile .

setup:
	./setup.sh

git-set-url:
	git remote set-url origin git@github.com:fgrosse/dotfiles.git

