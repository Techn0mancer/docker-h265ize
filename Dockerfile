FROM ubuntu:16.04
MAINTAINER Techn0mancer

RUN ENV DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -qy \
curl \
ffmpeg \
mkvtoolnix \
nodejs \
npm

RUN npm cache clean -f && npm install -g n && n stable && node --version

RUN npm install h265ize --global && ln -s /usr/bin/local/h265ize /h265ize

VOLUME /input /output
