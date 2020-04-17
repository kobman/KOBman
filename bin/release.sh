#!/bin/bash

kob_version="$1"

branch="tag"

kob_archive_download_repo="KOBman_target_repo"

kob_namespace= ${KOB_NAMESPACE:-hyperledgerkochi}

#sanityls
# if [[ -z "$VERSION" ]]; 
#     then
#         echo "Usage: release.sh <version>"
#  	    exit 0
# fi

echo "$kob_version"
#prepare branch
# echo "prepare branch"
# #git fetch
git checkout Dev
git branch -D "$branch"
git checkout -b "$branch"

#copy the tmpl file to /scripts
echo "copying tmpl file to scripts"
cp /$HOME/$USR/KOBman/scripts/tmpl/get.kobman.io.tmpl /$HOME/$USR/KOBman/scripts/

mv /$HOME/$USR/KOBman/scripts/get.kobman.io.tmpl /$HOME/$USR/KOBman/scripts/get.kobman.io

#replacing variables with actual values
echo "updating variables"
sed -i "s/@KOB_VERSION@/$kob_version/g" /$HOME/$USR/KOBman/scripts/get.kobman.io
sed -i "s/@KOB_ARCHIVE_DOWNLOAD_REPO@/$kob_archive_download_repo/g" /$HOME/$USR/KOBman/scripts/get.kobman.io
sed -i "s/@KOB_NAMESPACE@/$kob_namespace/g" /$HOME/$USR/KOBman/scripts/get.kobman.io

#Tagging 
echo "tagging"
git tag -a "$kob_version" -m "Releasing version $kob_version"
echo "pushing version"
git push origin $kob_version
git checkout Dev
git branch -D $branch
#pushing get.kobman.io to repo
# sudo git add /$HOME/$USR/KOBman/scripts/get.kobman.io
# sudo git commit -m "variables updated"
# sudo git push dev Dev

