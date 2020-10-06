#!/usr/bin/env bash

export HOST=ns1

bin/install.sh

sudo patch -d /etc/default < etc/${HOST}/default/named.diff

sudo patch -d /etc/bind < etc/${HOST}/bind/named.conf.options.diff

sudo mkdir /etc/bind/zones
sudo cp etc/${HOST}/bind/zones/* /etc/bind/zones
# diff -u etc/bind/named.conf.local etc/${HOST}/bind/named.conf.local > etc/${HOST}/bind/named.conf.local.diff
sudo patch -d /etc/bind < etc/${HOST}/bind/named.conf.local.diff

# sudo named-checkconf
sudo named-checkzone net1.domain /etc/bind/zones/db.net1.domain
sudo named-checkzone 128.10.in-addr.arpa /etc/bind/zones/db.10.128

# ip address show to 10.128.0.0/16
# sudo cp etc/${HOST}/netplan/00-private-nameservers.yaml /etc/netplan
sudo cp etc/${HOST}/resolv.conf /etc

sudo systemctl restart bind9