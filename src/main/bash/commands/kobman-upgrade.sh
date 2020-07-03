#!/bin/bash
function __kob_upgrade {
mkdir $KOBMAN_DIR/backup
__kobman_echo_white "Making backups..."
zip -r $KOBMAN_DIR/backup/kobman_backup.zip .kobman
__kobman_echo_white "Removing current version..."
find $KOBMAN_DIR -mindepth 1 -name backup -prune -o -exec rm -rf {} +
__kobman_echo_white "Fetching latest version..."
__kobman_secure_curl https://raw.githubusercontent.com/$KOBMAN_NAMESPACE/KOBman/dist/dist/get.kobman.io | bash
unzip $KOBMAN_DIR/backup/kobman_backup.zip -d $KOBMAN_DIR/backup
__kobman_echo_white "Restoring user configs..."
dir=$(find  $KOBMAN_DIR/backup/.kobman/envs -type d -name kob_env_*)
if [[ -n $dir ]]; then
    mv $KOBMAN_DIR/backup/.kobman/envs/kob_env_* $KOBMAN_DIR/envs
fi
if [[ -f $KOBMAN_DIR/backup/.kobman/var/*.proc ]]; then
    mv $KOBMAN_DIR/backup/.kobman/var/*.proc $KOBMAN_DIR/var/
fi
if [[ -f $KOBMAN_DIR/backup/.kobman/var/current ]]; then
    mv $KOBMAN_DIR/backup/.kobman/var/current $KOBMAN_DIR/var/
fi
source $KOBMAN_DIR/bin/kobman-init.sh
__kobman_echo_blue "Upgraded successfully"
__kobman_echo_blue "Current version:$(cat $KOBMAN_DIR/var/version.txt)"

rm -rf $KOBMAN_DIR/backup

##TODO:- validate whether the user configs are compatible with the current version
}



