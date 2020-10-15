#/usr/bin/env sh

sudo apt upgrade -y
sudo apt update -y

sudo apt install -y ansible
ansible-galaxy collection install ansible.posix