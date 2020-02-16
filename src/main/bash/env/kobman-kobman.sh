#!/bin/bash
Repo_name=${3:-KOBman}
__kobman_echo_red "kobman dev script initiating"
cd ~
sudo mkdir -p ${Repo_name}
cd ${Repo_name}
sudo mkdir -p test/ dependency/
sudo git clone https://github.com/EtricKombat/${Repo_name}
# sudo mv . ../src

 
