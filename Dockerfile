FROM ubuntu:16.04
MAINTAINER Techn0mancer

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

RUN apt-get update && apt-get install -qy \
	curl \
	ffmpeg \
	mkvtoolnix \
	nodejs \
	npm

RUN npm cache clean -f && npm install -g n && n stable && node --version

RUN npm install h265ize --global && ln -s /usr/bin/local/h265ize /h265ize

VOLUME /input /output
ENTRYPOINT ["/init"]
