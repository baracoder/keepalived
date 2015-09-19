FROM debian:stable
MAINTAINER Andreas Krüger

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install --no-install-recommends --no-install-suggests -yqq keepalived
