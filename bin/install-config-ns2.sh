#!/usr/bin/env bash

export HOST=ns2

bin/install.sh
sudo patch -d /etc/bind < etc/${HOST}/bind/named.conf.options.diff
sudo patch -d /etc/bind < etc/${HOST}/bind/named.conf.local.diff
sudo named-checkconf
sudo cp etc/${HOST}/netplan/* /etc/netplan
sudo netplan apply
sudo cp etc/${HOST}/resolv.conf /etc
sudo systemctl restart bind9