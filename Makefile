SHELL = /bin/zsh

.PHONY: setup test debug test-build plugins update-zsh-completions

define ZSH_PLUGINS_FILE_HEADER
#!/usr/bin/env zsh

# This file was generated by antibody (https://github.com/getantibody/antibody).
# Do not edit it directly but instead run "chezmoi cd", update zsh_plugins.txt
# and then run "make plugins".

endef
export ZSH_PLUGINS_FILE_HEADER

test: test-build
	docker run -it --rm chezmoi-test

debug: test-build
	docker run -it --rm chezmoi-test zsh

test-build:
	docker build -t chezmoi-test -f ./test/Dockerfile .

setup:
	./setup.sh

plugins:
	echo -e "$$ZSH_PLUGINS_FILE_HEADER" > "$$HOME/.zsh_plugins.sh"
	antibody bundle < zsh_plugins.txt  >> "$$HOME/.zsh_plugins.sh"

update-zsh-completions:
	http https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_golang > completions/_go
	kubectl completion zsh > completions/_kubectl
	rm -f ~/.zcompdump

.PHONY: git-set-url
git-set-url:
	git remote set-url origin git@github.com:fgrosse/dotfiles.git
