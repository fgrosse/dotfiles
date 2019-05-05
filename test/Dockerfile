FROM ubuntu

RUN apt-get update && apt-get install -y git wget vim zsh make

WORKDIR /root

ADD test/antibody /bin/antibody
ADD setup.sh /root
RUN chmod u+x /root/setup.sh

CMD /root/setup.sh && chezmoi verify && chezmoi data
