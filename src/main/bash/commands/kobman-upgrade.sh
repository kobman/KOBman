#!/bin/bash

function __kob_upgrade {
mkdir ~/user_configs
zip -r user_configs/kobman_backup.zip $KOBMAN_DIR
__kobman_secure_curl "https://raw.githubusercontent.com/hyperledgerkochi/KOBman/dist/dist/get.kobman.io | bash"
unzip user_configs/kobman_backup.zip -d ~/user_configs
if [[ -d ~/user_configs/.kobman/envs/kob_env_* ]]; then
    mv ~/user_configs/.kobman/envs/kob_env_* $KOBMAN_DIR/envs/
fi
if [[ -f ~/user_configs/.kobman/var/*.proc ]]; then
    mv ~/user_configs/.kobman/var/*.proc $KOBMAN_DIR/var/
fi
if [[ -f ~/user_configs/.kobman/var/current ]]; then
    mv ~/user_configs/.kobman/var/current $KOBMAN_DIR/var/
fi

__kobman_echo_blue "Upgraded successfully"
__kobman_echo_blue "Current version:$(cat $KOBMAN_DIR/var/version.txt)"

rm -rf ~/user_configs

##TODO:- validate whether the user configs are compatible with the current version
}
