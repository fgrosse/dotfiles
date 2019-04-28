FROM ubuntu

RUN apt-get update && apt-get install -y git wget vim

WORKDIR /root

ADD setup.sh /root
RUN chmod u+x /root/setup.sh

CMD /root/setup.sh && chezmoi verify && chezmoi data
