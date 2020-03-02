#!/bin/bash
cd ../
sudo git pull origin master
sudo git add .
read -p "please insert your commit message" msg
sudo git commit -m "$msg commit on: $(date)"
sudo git push origin master
