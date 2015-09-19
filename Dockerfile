#FROM debian:stable
#MAINTAINER Andreas Krüger
#ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get update -qq
#RUN apt-get install -yqq keepalived ipvsadm

FROM centos:centos7
RUN yum install -y epel-release
RUN yum install -y keepalived
