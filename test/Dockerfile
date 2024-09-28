FROM fedora:latest

RUN dnf update -y && dnf install -y git wget vim zsh make

ENV HOST="Test Container"
WORKDIR /root

COPY test/example-config.yml /root/.config/chezmoi/chezmoi.yaml
COPY setup-tools.sh /root
COPY setup.sh /root
