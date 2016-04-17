FROM ubuntu:14.04

MAINTAINER j3r0lin <j3r0lin@icloud.com>

ENV DEBIAN_FRONTEND noninteractive


WORKDIR /opt/
RUN apt-get update && apt-get install -y wget unzip && \
	wget -q http://emqtt.io/static/brokers/emqttd-ubuntu64-1.0.1-beta-20160416.zip
RUN unzip emqttd-*.zip
WORKDIR /opt/emqttd
RUN adduser --system --disabled-password --disabled-login emqtt
RUN chown -R emqtt:emqtt emqttd
USER emqtt
EXPOSE 1883
CMD ["./bin/emqttd console"]