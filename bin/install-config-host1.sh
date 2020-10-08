#!/usr/bin/env bash

export HOST=host1

sudo cp etc/${HOST}/netplan/* /etc/netplan
sudo netplan apply
sudo cp etc/${HOST}/resolv.conf /etc