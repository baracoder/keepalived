FROM alpine:3.3
MAINTAINER Herman Fries

RUN apk add --update \
    kmod keepalived net-tools \
    && rm -rf /var/cache/apk/*

COPY run.sh /run.sh
COPY keepalived.conf /etc/keepalived/keepalived.conf

ENTRYPOINT [ "/run.sh" ]
