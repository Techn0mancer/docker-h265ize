FROM linuxserver/baseimage.node
MAINTAINER Techn0mancer

RUN add-apt-repository ppa:mc3man/trusty-media && \
apt-get update && \
apt-get install -qy ffmpeg && \
apt-get clean

RUN git clone https://github.com/FallingSnow/h265ize.git && \
cd h265ize && \
npm install h265ize && \
chmod +x h265ize

VOLUME /input /output
