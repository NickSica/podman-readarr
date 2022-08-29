FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y libicu-dev
RUN apt-get install -y wget curl sqlite3
RUN cd tmp
RUN wget --content-disposition 'http://readarr.servarr.com/v1/update/develop/updatefile?os=linux&runtime=netcore&arch=x64'

RUN tar -xvzf Readarr*.linux*.tar.gz
RUN mv Readarr /opt/

ENV XDG_CONFIG_HOME=/config/xdg
#WORKDIR /config

CMD /opt/Readarr/Readarr -data=/config
EXPOSE 8787
VOLUME /config
