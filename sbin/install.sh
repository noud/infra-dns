#/usr/bin/env bash

sudo apt upgrade -y
sudo apt update -y --allow-releaseinfo-change
sudo apt install -y git

sudo apt install -y ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy install petermosmans.customize-gnome
ansible-galaxy install wahidsadik.apache-virtual-host
ansible-galaxy install gantsign.visual-studio-code-extensions

mkdir -p $USER/.ansible/roles && cd $USER/.ansible/roles && git clone https://github.com/PeterMosmans/ansible-role-customize-gnome.git

ansible-playbook -i domain all.yml --ask-vault-pass