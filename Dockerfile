FROM ubuntu:latest
MAINTAINER Techn0mancer

#RUN add-apt-repository ppa:mc3man/trusty-media && \
RUN apt-get update && apt-get install -qy \
build-essential \
git-core \
ffmpeg \
nodejs-legacy \
npm \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN sudo ln -s "$(which nodejs)" /usr/bin/node
RUN git clone https://github.com/FallingSnow/h265ize.git && cd h265ize && npm install h265ize && chmod +x h265ize

VOLUME /input /output
