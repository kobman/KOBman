#!/bin/bash


cd ${KOBMAN_DIR}/tmp
# sudo wget https://github.com/EtricKombat/KOBman/blob/master/releases/kobman-test.zip
# unzip kobman-test.zip

curl --location --progress-bar "${KOBMAN_SERVICE}/${KOBMAN_NAMESPACE}/KOBman/master/releases/kobman-test.zip" > "$kobman_zip_test"
unzip -qo "$kobman_zip_test" -d "$kobman_stage_folder"

figlet Upload
figlet Test Functions  
OLD_IFS="$IFS"
IFS=$'\n'
scripts=($(find "${KOBMAN_DIR}/tests/commands" "${KOBMAN_DIR}/tests/envs" -type f -name 'test-kob-*'))
for f in "${scripts[@]}"; do
        source "$f"
done
IFS="$OLD_IFS"
unset scripts f 

