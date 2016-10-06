FROM alpine:3.4
MAINTAINER Techn0mancer

RUN apk add --no-cache --update \
        bash \
	curl \
	ffmpeg \
	nodejs \
	tar && \

    curl -o /tmp/s6-overlay.tar.gz -L \
	"https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.5/s6-overlay-amd64.tar.gz " && \
	tar xvfz /tmp/s6-overlay.tar.gz -C / && \

    apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
	mkvtoolnix && \

    npm install h265ize --global && ln -s /usr/bin/local/h265ize /h265ize && \

    apk del --purge \
	curl tar && \
    rm -rf /var/cache/apk/* /tmp/*

VOLUME /input /output

ENTRYPOINT ["/init"]
