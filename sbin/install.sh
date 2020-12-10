#/usr/bin/env sh

sudo apt upgrade -y
sudo apt update -y

sudo apt install -y ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy install petermosmans.customize-gnome