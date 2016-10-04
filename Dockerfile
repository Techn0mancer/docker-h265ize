FROM ubuntu:xenial
MAINTAINER Techn0mancer

#RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update && apt-get install -qy --force-yes \
curl \
git \
ffmpeg \
mkvtoolnix \
nodejs \
npm \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN npm cache clean -f && \
#npm install -g n && \
#n stable && \
#node --version

RUN npm install h265ize --global
RUN ln -s /usr/bin/local/h265ize /h265ize

VOLUME /input /output
