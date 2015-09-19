FROM debian:stable
MAINTAINER Andreas Krüger
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get install --no-install-recommends --no-install-suggests -yqq keepalived

COPY run.sh /run.sh
COPY keepalived.conf /etc/keepalived/keepalived.conf

ENTRYPOINT [ "/run.sh" ]
