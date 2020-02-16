#!/bin/bash


__kobman_echo_red "kobman dev script initiating"
sudo cd ~
sudo mkdir -p ${Repo_name}
sudo mkdir -p test/ dependency/
sudo git clone https://github.com/EtricKombat/${Repo_name}
# sudo cd ${Repo_name}
# sudo mv . ../src

 
