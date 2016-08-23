FROM alpine:latest

MAINTAINER Fábio Luciano <fabioluciano@php.net>

RUN apk update \
  && apk --update add supervisor fuse \
  && rm -rf /var/cache/apk/*


WORKDIR /tmp

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
