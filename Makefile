SHELL = /bin/zsh
TEST_IMAGE_NAME = fgrosse-dotfiles-test

.PHONY: help install setup setup-tools test debug test-docker-image git-set-url save-shell-settings

help: # List all targets and help information.
	@echo "\033[97mAvailable commands:\033[0m"
	@grep --no-filename -E '^([a-zA-Z0-9-]+:.*?)#?' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":[^#]*(# ?)?"}; { \
			if (length($$1) > 0) { \
				printf "  \033[33m%-30s\033[0m %s\n", $$1, $$2; \
			} \
		}'

.DEFAULT_GOAL := help

install: setup-tools setup # Install packages, tools and setup dotfiles

setup: # Setup dotfiles
	./setup.sh

setup-tools: # Setup packages and tools
	./setup-tools.sh

test: test-docker-image # Run tests using Docker
	docker run -it --rm $(TEST_IMAGE_NAME) zsh -c "./setup.sh && ./setup-tools.sh && chezmoi verify && zsh"

debug: test-docker-image # Start a shell in the test Docker image
	docker run -it --rm $(TEST_IMAGE_NAME) zsh

test-docker-image: # Build the test Docker image
	docker build -t $(TEST_IMAGE_NAME) -f ./test/Dockerfile .

git-set-url: # Set the git remote url to the SSH version
	git remote set-url origin git@github.com:fgrosse/dotfiles.git

save-shell-settings: # Save Gnome shell extension settings to file
	dconf dump '/org/gnome/shell/extensions/just-perfection/' > gnome-shell-extension/just-perfection.conf
