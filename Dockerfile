FROM debian:jessie
MAINTAINER Ruben Silva <rubensilva84@gmail.com>

RUN useradd -m -s /bin/bash -p '*' dropbox
WORKDIR /home/dropbox

RUN apt-get update && apt-get install -y wget

USER dropbox
RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

USER root
RUN apt-get purge wget && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER dropbox

VOLUME /home/dropbox

ENTRYPOINT ["/home/dropbox/.dropbox-dist/dropboxd"]