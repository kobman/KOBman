#!/bin/bash

sudo apt install figlet -y
sudo figlet Fresh -f small 
sudo figlet Environment -f small
mkdir -p /usr/home/kobman
cd /usr/home/kobman
sudo git clone https://github.com/EtricKombat/KOBman.git
sudo git clone https://github.com/EtricKombat/TheOrgBook
sudo git clone https://github.com/EtricKombat/greenlight
sudo git clone https://github.com/EtricKombat/von-network



curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
