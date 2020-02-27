#!/bin/bash

function __kobman_develpment_kobman_dir {



Repo_name=${3:-KOBman}
__kobman_echo_red "KOBman development environment setting up at /usr/home/kobman_dev_dir "
cd ~
sudo mkdir -p /usr/home/${Repo_name}_dev_dir
cd ${Repo_name}_dev_dir
sudo mkdir -p test/ dependency/
sudo git clone https://github.com/EtricKombat/${Repo_name}

} 
