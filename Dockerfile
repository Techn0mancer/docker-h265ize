FROM linuxserver/baseimage
MAINTAINER Techn0mancer

RUN echo "deb http://mkvtoolnix.download/ubuntu/trusty/ ./" >> /etc/apt/sources.list
#RUN add-apt-repository ppa:ruediger-c-plusplus/vobsub2srt
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update && apt-get install -qy --force-yes \
ffmpeg \
mkvtoolnix \
npm \
#vobsub2srt \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm cache clean -f && \
npm install -g n && \
n stable && \
node --version

RUN ln -s "$(which nodejs)" /usr/bin/node
RUN npm install h265ize
RUN cd /node_modules/h265ize

VOLUME /input /output
