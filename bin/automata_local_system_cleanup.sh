#!/bin/bash 

cd ~ 
sudo rm -rf greenlight/ TheOrgBook/ von-network/ KOBman/ test/ dependency/ ./kobman/
cd /usr/home/
sudo rm -rf *_dev_dir/
#sudo rm -rf TheOrgBook_dev_dir/
#sudo rm -rf greenlight_dev_dir/
#sudo rm -rf von-network_dev_dir/ 


sudo figlet Clean-Up -f small
sudo reboot

