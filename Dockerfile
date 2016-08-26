FROM alpine:latest

MAINTAINER Fábio Luciano <fabioluciano@php.net>

WORKDIR /tmp

RUN apk update \
  && apk --update --no-cache add supervisor fuse git \
  && rm -rf /var/cache/apk/*

RUN apk update \
 && apk --update --no-cache add automake autoconf g++

RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git \
  && cd s3fs-fuse \
  && ./autogen.sh \
  && ./configure \
  && make \
  && sudo make install

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
