#!/bin/bash

sudo apt install figlet -y
sudo figlet Fresh -f small 
sudo figlet Environment -f small
sudo git clone https://github.com/TrinityGroup/KOBDevOps.git
curl -L https://raw.githubusercontent.com/TrinityGroup/KOBDevOps/master/get.kobman.io | bash

