#/usr/bin/env bash

sudo apt upgrade -y
sudo apt update -y --allow-releaseinfo-change
sudo apt install -y git

sudo apt install -y ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy install petermosmans.customize-gnome

mkdir -p $USER/.ansible/roles && cd $USER/.ansible/roles && git clone https://github.com/PeterMosmans/ansible-role-customize-gnome.git

ansible-playbook -i domain all.yml --ask-vault-pass