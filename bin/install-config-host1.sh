#!/usr/bin/env bash

export HOST=host1

sudo cp etc/${HOST}/netplan/02-static-address.yaml /etc/netplan
sudo cp etc/${HOST}/netplan/00-private-nameservers.yaml /etc/netplan
sudo netplan apply
sudo cp etc/${HOST}/resolv.conf /etc