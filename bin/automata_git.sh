#!/bin/bash
cd ../
sudo git pull origin master
sudo git add .
read -p "Enter your commited message : " msg
sudo git commit -m "${msg} commit on: $(date)"
sudo git push origin master
