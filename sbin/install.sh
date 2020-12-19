#/usr/bin/env bash

sudo apt upgrade -y
sudo apt update -y --allow-releaseinfo-change
sudo apt install -y git

sudo apt install -y ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy install petermosmans.customize-gnome

mkdir -p $USER/.ansible/roles && cd $USER/.ansible/roles && git clone https://github.com/PeterMosmans/ansible-role-customize-gnome.git

declare -a arr=("packages" \
"infra" \
"develop" \
"docker"
)

cd ~/workspaces/laravel-workspace/infra-dns
for i in "${arr[@]}"
do
    export PLAYBOOK="$i"
    ansible-playbook -i domain ${PLAYBOOK}.yml --ask-vault-pass 
done