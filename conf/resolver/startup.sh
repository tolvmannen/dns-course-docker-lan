#!/bin/bash
sudo cp /tmp/conf/common/resolv.conf /etc/resolv.conf
#cp /etc/resolv.conf.override /etc/resolv.conf
/usr/sbin/syslog-ng --no-caps
service ssh start
service named start
tail -F keepalive
