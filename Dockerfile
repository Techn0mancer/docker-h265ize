FROM linuxserver/baseimage
MAINTAINER Techn0mancer

RUN add-apt-repository ppa:mc3man/trusty-media && \
apt-get update && apt-get install -qy \
build-essential \
git-core \
ffmpeg \
nodejs \
npm \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/FallingSnow/h265ize.git && cd h265ize && npm install && chmod +x h265ize

VOLUME /input /output
