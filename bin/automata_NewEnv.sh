#!/bin/bash

sudo apt install figlet -y
sudo figlet Fresh -f small 
sudo figlet Environment -f small
sudo git clone https://github.com/EtricKombat/KOBman.git
curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash
