FROM ubuntu:14.04

MAINTAINER j3r0lin <j3r0lin@icloud.com>

ENV DEBIAN_FRONTEND noninteractive


WORKDIR /opt/
RUN wget http://emqtt.io/downloads/ubuntu
RUN unzip emqttd-*.zip
WORKDIR /opt/emqttd
RUN adduser --system --disabled-password --disabled-login emqtt
USER emqtt
EXPOSE 1883
CMD ["bin/emqttd console"]