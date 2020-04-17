#!/bin/bash

KOB_REL_VERSION=$1
KOB_ARCHIVE_DOWLOAD_REPO="KOBman_target_repo"
BRANCH="Dev"
KOB_NAMESPACE="asa1997"

#Checkout latest tag
git checkout tags/$KOB_REL_VERSION -b $KOB_REL_VERSION-branch

if [ -d $KOB_ARCHIVE_DOWLOAD_REPO ]
    then
        rm -rf $KOB_ARCHIVE_DOWLOAD_REPO
    else
        echo "cloning $KOB_ARCHIVE_DOWLOAD_REPO"
        git clone https://github.com/$KOB_NAMESPACE/$KOB_ARCHIVE_DOWLOAD_REPO
        mkdir $KOB_ARCHIVE_DOWLOAD_REPO/dist
fi 

echo "moving necessary files to target"
tar -cvf kobman_latest.tar ~/dev_branch/KOBman/src/ ~/dev_branch/KOBman/bin/
cp kobman_latest.tar ~/dev_branch/KOBman/$KOB_ARCHIVE_DOWLOAD_REPO/dist/kobman-$KOB_REL_VERSION.tar
mv kobman_latest.tar $KOB_ARCHIVE_DOWLOAD_REPO/dist 
mv ~/dev_branch/KOBman/scripts/get.kobman.io ~/dev_branch/KOBman/$KOB_ARCHIVE_DOWLOAD_REPO/dist

echo "moving into $KOB_ARCHIVE_DOWLOAD_REPO"
cd $KOB_ARCHIVE_DOWLOAD_REPO

echo "saving changes and pushing"
git add .
# sudo git add KOBman-installer.sh
git commit -m "Released the version $KOB_REL_VERSION"
# echo "pushing to release master"
git push origin master -f