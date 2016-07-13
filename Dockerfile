FROM linuxserver/baseimage
MAINTAINER Techn0mancer

#RUN wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
RUN add-apt-repository deb http://mkvtoolnix.download/ubuntu/wily/ ./
RUN add-apt-repository ppa:mc3man/trusty-media && \
#add-apt-repository ppa:ruediger-c-plusplus/vobsub2srt && \
apt-get update && apt-get install -qy \
#build-essential \
#git-core \
ffmpeg \
#mkvtoolnix-cli \
#nodejs \
npm \
#vobsub2srt \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install h265ize
RUN npm cache clean -f && \
npm install -g n && \
n stable && \
node --version

#RUN mkdir /h265ize
#WORKDIR /h265ize

RUN ln -s "$(which nodejs)" /usr/bin/node
#RUN git clone https://github.com/FallingSnow/h265ize.git && \
#cd h265ize && \
#npm install && \
#chmod +x h265ize

VOLUME /input /output
