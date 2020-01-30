#!/bin/bash


cd ${KOBMAN_DIR}/tmp
wget https://github.com/EtricKombat/KOBman/raw/master/releases/kobman-test.zip

mkdir -p "$kobman_tests_folder"
cd ${kobman_tests_folder}
unzip "${KOBMAN_DIR}/tmp/kobman-test.zip"
figlet Upload
figlet Test Functions  
OLD_IFS="$IFS"
IFS=$'\n'
scripts=($(find "${KOBMAN_DIR}/tmp" -type f -name 'test-kob-*'))
for f in "${scripts[@]}"; do
        source "$f"
done
IFS="$OLD_IFS"
unset scripts f 

