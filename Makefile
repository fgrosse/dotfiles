.PHONY: setup test debug test-build

test: test-build
	docker run -it --rm chezmoi-test

debug: test-build
	docker run -it --rm chezmoi-test bash

test-build:
	docker build -t chezmoi-test -f ./test/Dockerfile .

setup:
	./setup.sh
