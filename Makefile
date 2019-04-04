.PHONY: setup test

test:
	docker build -t chezmoi-test -f ./test/Dockerfile . && docker run -it --rm chezmoi-test

setup:
	./setup.sh
