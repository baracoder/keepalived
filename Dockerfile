FROM debian:stable
MAINTAINER Andreas Krüger

#RUN yum install -y epel-release
RUN apt-get install -yg keepalived
