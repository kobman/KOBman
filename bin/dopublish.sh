#!/bin/bash

KOB_REL_VERSION=$1
KOB_ARCHIVE_DOWLOAD_REPO="KOBman_target_repo"
BRANCH="release"
KOB_NAMESPACE="asa1997"

#Checkout latest tag
# The branch is used to make the tar files.
git branch -D $KOB_REL_VERSION-branch
git checkout tags/$KOB_REL_VERSION -b $KOB_REL_VERSION-branch

echo "making the tar files..."
tar -cvf kobman_latest.tar ~/dev_branch/KOBman/src/ ~/dev_branch/KOBman/bin/
cp kobman_latest.tar ~/dev_branch/KOBman/bin/kobman-$KOB_REL_VERSION.tar

#The branch is used to prepare the target repo and pushing
git checkout -b $BRANCH
git clone https://github.com/asa1997/$KOB_ARCHIVE_DOWLOAD_REPO
mkdir $KOB_ARCHIVE_DOWLOAD_REPO/dist
echo "moving necessary files to target"
mv *.tar $KOB_ARCHIVE_DOWLOAD_REPO/dist 
mv ~/dev_branch/KOBman/scripts/get.kobman.io ~/dev_branch/KOBman/$KOB_ARCHIVE_DOWLOAD_REPO/dist

echo "moving into $KOB_ARCHIVE_DOWLOAD_REPO"
cd $KOB_ARCHIVE_DOWLOAD_REPO
echo "saving changes and pushing"
git add .
git commit -m "Released the version $KOB_REL_VERSION"
git push origin master -f
cd ..
rm -rf $KOB_ARCHIVE_DOWLOAD_REPO
git checkout Dev
git branch -D $BRANCH


