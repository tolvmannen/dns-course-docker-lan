#!/bin/bash
sudo cp /tmp/conf/common/resolv.conf /etc/resolv.conf
sudo sed -ie "s/^myhostname =.*/myhostname = mail.$DOMAIN/" /etc/postfix/main.cf
sudo sed -ie "s/^mydestination =.*/mydestination = $DOMAIN/" /etc/postfix/main.cf
sudo echo "@$DOMAIN ubuntu" > /etc/postfix/virtual
sudo postmap /etc/postfix/virtual
sudo service postfix start
service ssh start
tail -F keepalive
