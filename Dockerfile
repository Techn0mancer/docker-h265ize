FROM lsiobase/xenial
MAINTAINER Techn0mancer

RUN apt-get update && apt-get install -qy --force-yes \
curl \
#git \
ffmpeg \
mkvtoolnix \
nodejs \
npm

RUN npm cache clean -f && npm install -g n && n stable && node --version

#RUN git clone https://github.com/FallingSnow/h265ize.git && cd h265ize && npm install && chmod +x h265ize
RUN npm install h265ize --global && ln -s /usr/bin/local/h265ize /h265ize

VOLUME /input /output
