FROM linuxserver/baseimage
MAINTAINER Techn0mancer

#RUN echo "deb http://mkvtoolnix.download/ubuntu/wily/ ./" >> /etc/apt/sources.list && \
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update && apt-get install -qy --force-yes \
ffmpeg \
#mkvtoolnix \
#nodejs \
npm \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN mkdir /h265ize && cd /h265ize
#WORKDIR /h265ize

RUN npm cache clean -f && \
npm install -g n && \
n stable && \
node --version

RUN npm install h265ize

#RUN mkdir /h265ize
#WORKDIR /h265ize

RUN ln -s "$(which nodejs)" /usr/bin/node
#RUN git clone https://github.com/FallingSnow/h265ize.git && \
#cd h265ize && \
#npm install && \
#chmod +x h265ize

VOLUME /input /output
