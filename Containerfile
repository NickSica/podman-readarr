FROM ubuntu:latest

RUN \
    echo "**** install packages ****" && \
    apt-get update && \
    apt-get install -y libicu-dev && \
    apt-get install -y wget curl sqlite3
RUN cd tmp && \
    wget --content-disposition 'http://readarr.servarr.com/v1/update/develop/updatefile?os=linux&runtime=netcore&arch=x64' && \
    tar -xvzf Readarr*.linux*.tar.gz && \
    mv Readarr /opt/

ENV XDG_CONFIG_HOME=/config

ENTRYPOINT /opt/Readarr/Readarr -data=/config
EXPOSE 8787
VOLUME /config
