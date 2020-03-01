#!/bin/bash
git pull origin master
git add .
read -p "please insert your commit message" msg
git commit -m "$msg commit on: $(date)"
git push origin master
