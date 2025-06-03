#!/bin/sh
DNF_CMD=$(which dnf)
APT_GET_CMD=$(which apt-get)
if [[ ! -z $DNF_CMD ]]; then
    sudo dnf install -y ansible ansible-galaxy python3-passlib vagrant
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt update
    sudo apt install -y ansible ansible-galaxy python3-passlib
fi
vagrant plugin install vagrant-libvirt
