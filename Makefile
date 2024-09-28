SHELL = /bin/zsh

TEST_IMAGE_NAME = fgrosse-dotfiles-test

.PHONY: install
install: setup-tools setup

.PHONY: setup
setup:
	./setup.sh

.PHONY: setup-tools
setup-tools:
	./setup-tools.sh

.PHONY: test
test: test-docker-image
	docker run -it --rm $(TEST_IMAGE_NAME) zsh -c "./setup-tools.sh && ./setup.sh; chezmoi verify && zsh"

.PHONY: debug
debug: test-docker-image
	docker run -it --rm $(TEST_IMAGE_NAME) zsh

.PHONY: test-docker-image
test-docker-image:
	docker build -t $(TEST_IMAGE_NAME) -f ./test/Dockerfile .

.PHONY: git-set-url
git-set-url:
	git remote set-url origin git@github.com:fgrosse/dotfiles.git

