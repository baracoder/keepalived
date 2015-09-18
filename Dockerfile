FROM debian:stable
MAINTAINER Andreas Krüger

RUN apt-get update
RUN apt-get install -y keepalived
