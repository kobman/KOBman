#!/bin/bash 

cd ~ 
sudo rm -rf .kobman/ 
sudo rm -rf KOBman/
sudo rm -rf dependency/
sudo rm -rf test/

cd /usr/home/kobman
sudo rm -rf *_dev_dir/
#sudo rm -rf TheOrgBook_dev_dir/
#sudo rm -rf greenlight_dev_dir/
#sudo rm -rf von-network_dev_dir/ 


sudo figlet Clean-Up -f small
sudo reboot

