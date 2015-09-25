FROM debian:jessie
MAINTAINER ruben.silva@cortex-intelligence.com

RUN apt-get update && apt-get install -y wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

VOLUME /root/Dropbox

ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]