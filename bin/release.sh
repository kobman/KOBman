#!/bin/bash

kob_version="$1"

branch="release"

#kob_archive_download_repo="KOBman_target_repo"

kob_namespace=${KOBMAN_NAMESPACE:-hyperledgerkochi}
source $HOME/$USR/KOBman/bin/release_var_setup.sh
#sanityls
# if [[ -z "$VERSION" ]]; 
#     then
#         echo "Usage: release.sh <version>"
#  	    exit 0
# fi

#echo "$kob_version"
#prepare branch
# echo "prepare branch"
# #git fetch
git checkout master
# git branch -D "$branch"
# git checkout -b "$branch"

#copy the tmpl file to /scripts
#echo "copying tmpl file to scripts"
cp $KOBMAN_DIR/scripts/tmpl/get.kobman.io.tmpl $KOBMAN_DIR/scripts/

mv $KOBMAN_DIR/scripts/get.kobman.io.tmpl $KOBMAN_DIR/scripts/get.kobman.io

#replacing variables with actual values
#echo "updating variables"
sed -i "s/@KOB_VERSION@/$kob_version/g" $KOBMAN_DIR/scripts/get.kobman.io
sed -i "s/@KOB_ARCHIVE_DOWNLOAD_REPO@/$KOB_ARCHIVE_DOWNLOAD_REPO/g" $KOBMAN_DIR/scripts/get.kobman.io
sed -i "s/@KOB_NAMESPACE@/$KOB_NAMESPACE/g" $KOBMAN_DIR/scripts/get.kobman.io

sudo git add .
sudo git commit -m "Variables replaced"
#Tagging 
#echo "tagging"
git tag -a "$kob_version" -m "Releasing version $kob_version"
#echo "pushing version"
git push origin $kob_version
# git checkout Dev
#git branch -D $branch
git checkout -b $branch
git checkout $branch
git merge master

#pushing get.kobman.io to repo
# sudo git add /$HOME/$USR/KOBman/scripts/get.kobman.io
# sudo git commit -m "variables updated"
# sudo git push dev Dev

