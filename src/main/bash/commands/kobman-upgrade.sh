#!/bin/bash
function __kob_upgrade {
mkdir $KOBMAN_DIR/bak
__kobman_echo_white "Making backups..."
zip -r $KOBMAN_DIR/bak/kobman_bak.zip .kobman
__kobman_echo_white "Removing current version..."
find $KOBMAN_DIR -mindepth 1 -name bak -prune -o -exec rm -rf {} +
__kobman_echo_white "Fetching latest version..."
__kobman_secure_curl https://raw.githubusercontent.com/$KOBMAN_NAMESPACE/KOBman/dist/dist/get.kobman.io | bash
unzip $KOBMAN_DIR/bak/kobman_bak.zip -d $KOBMAN_DIR/bak
__kobman_echo_white "Restoring user configs..."
dir=$(find  $KOBMAN_DIR/bak/.kobman/envs -type d -name kobman-*)
for i in "${dir[@]}"; do
    n=${i##*/}
    mv $KOBMAN_DIR/bak/.kobman/envs/$n $KOBMAN_DIR/envs
done
if [[ -f $KOBMAN_DIR/bak/.kobman/var/*.proc ]]; then
    mv $KOBMAN_DIR/bak/.kobman/var/*.proc $KOBMAN_DIR/var
fi
if [[ -f $KOBMAN_DIR/bak/.kobman/var/current ]]; then
    mv $KOBMAN_DIR/bak/.kobman/var/current $KOBMAN_DIR/var
fi
source $KOBMAN_DIR/bin/kobman-init.sh
__kobman_echo_blue "Upgraded successfully"
__kobman_echo_blue "Current version:$(cat $KOBMAN_DIR/var/version.txt)"

unset n i dir
rm -rf $KOBMAN_DIR/bak

##TODO:- validate whether the user configs are compatible with the current version
}



