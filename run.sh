#!/bin/bash
# This runs INSIDE the docker container.
PATH_KEEPALIVED_CONF="/etc/keepalived/keepalived.conf"

interface=${KEEPALIVED_INTERFACE:-eth0}
priority=${KEEPALIVED_PRIORITY:-100}
self=${KEEPALIVED_SELF}
peer=${KEEPALIVED_PEER}
floating_ip=${KEEPALIVED_VIRTUAL_IP:-172.16.50.5}
password=${KEEPALIVED_PASSWORD:-secret}

# Replace values in template
perl -p -i -e "s/\{\{ interface \}\}/$interface/" $PATH_KEEPALIVED_CONF
perl -p -i -e "s/\{\{ priority \}\}/$priority/" $PATH_KEEPALIVED_CONF
perl -p -i -e "s/\{\{ self \}\}/$self/" $PATH_KEEPALIVED_CONF
perl -p -i -e "s/\{\{ peer \}\}/$peer/" $PATH_KEEPALIVED_CONF
perl -p -i -e "s/\{\{ floating_ip \}\}/$floating_ip/" $PATH_KEEPALIVED_CONF
perl -p -i -e "s/\{\{ password \}\}/$password/" $PATH_KEEPALIVED_CONF


modprobe ip_vs

# Foreground keepalived
keepalived -f /etc/keepalived/keepalived.conf --dont-fork --log-console
