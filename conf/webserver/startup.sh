#!/bin/bash
sudo cp /tmp/conf/common/resolv.conf /etc/resolv.conf
#/usr/sbin/syslog-ng --no-caps
sudo sed -ie "s/DOMAIN/$DOMAIN/g"  /etc/nginx/sites-available/siteconf
sudo sed -ie "s/DOMAIN/$DOMAIN/g"  /var/www/html/index.html
service ssh start
sudo service nginx start
tail -F keepalive
