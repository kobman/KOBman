#!/bin/bash

kob_rel_version=$1
kob_archive_download_repo="KOBman_target_repo"
branch="REL-$kob_rel_version"
kob_namespace= ${KOB_NAMESPACE:-hyperledgerkochi}
#Checkout latest tag
# The branch is used to make the tar files.
git branch -D $kob_rel_version-branch
git checkout tags/$kob_rel_version -b $kob_rel_version-branch

echo "making the tar files..."
tar -cvf /$HOME/$USR/KOBman/bin/kobman_latest.tar /$HOME/$USR/KOBman/src/ /$HOME/$USR/KOBman/bin/
cp /$HOME/$USR/KOBman/bin/kobman_latest.tar /$HOME/$USR/KOBman/bin/kobman-$kob_rel_version.tar

#The branch is used to prepare the target repo and pushing
git checkout -b $branch
git clone https://github.com/asa1997/$kob_archive_download_repo
mkdir $kob_archive_download_repo/dist
echo "moving necessary files to target"
mv /$HOME/$USR/KOBman/bin/kobman*.tar $kob_archive_download_repo/dist 
mv /$HOME/$USR/KOBman/scripts/get.kobman.io /$HOME/$USR/KOBman/$kob_archive_download_repo/dist

echo "moving into $kob_archive_download_repo"
cd $kob_archive_download_repo
git fetch
echo "saving changes and pushing"
git add .
git commit -m "Released the version $kob_rel_version"
git push origin master -f
cd ..
rm -rf $kob_archive_download_repo
git checkout Dev
git branch -D $branch


