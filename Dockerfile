FROM binhex/arch-base
#FROM linuxserver/baseimage
MAINTAINER Techn0mancer

#RUN add-apt-repository ppa:mc3man/trusty-media && \
#apt-get update && apt-get install -qy \
#build-essential \
#git-core \
#ffmpeg \
#nodejs \
#npm \
#&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN sudo ln -s "$(which nodejs)" /usr/bin/node
#RUN git clone https://github.com/FallingSnow/h265ize.git && cd h265ize && npm install h265ize && chmod +x h265ize

RUN sudo pacman -S ffmpeg nodejs; \
 yaourt vobsub2srt-git; \
 git clone https://github.com/FallingSnow/h265ize.git && cd h265ize && npm install && chmod +x h265ize

VOLUME /input /output
