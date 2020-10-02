#!/usr/bin/env bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y bind9 bind9utils bind9-doc
sudo systemctl enable bind9
sudo systemctl start bind9

sudo named-checkconf
sudo ufw allow Bind9