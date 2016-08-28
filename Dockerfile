FROM alpine:latest

MAINTAINER Fábio Luciano <fabioluciano@php.net>

RUN apk update \
  && apk --update --no-cache add supervisor build-base git automake autoconf \
     fuse-dev curl-dev libxml2-dev openssl-dev \
  && rm -rf /var/cache/apk/* \
  && git clone https://github.com/s3fs-fuse/s3fs-fuse.git /tmp/s3fs-fuse \
  && cd /tmp/s3fs-fuse && ./autogen.sh && ./configure --with-openssl \
  && make && make install \
  && rm /tmp/s3fs-fuse -rf

COPY files/supervisord.conf /etc/

VOLUME /mnt
WORKDIR /mnt

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
