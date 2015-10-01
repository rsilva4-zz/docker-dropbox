FROM debian:jessie
MAINTAINER ruben.silva@cortex-intelligence.com

RUN useradd -m -s /bin/bash -p '*' dropbox
WORKDIR /home/dropbox

RUN apt-get update && apt-get install -y wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER dropbox
RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

VOLUME /home/dropbox

ENTRYPOINT ["/home/dropbox/.dropbox-dist/dropboxd"]