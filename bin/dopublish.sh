#!/bin/bash

KOB_VERSION=$1
KOB_ARCHIVE_DOWLOAD_REPO="KOBman_website"
BRANCH="master"
#moving into dist folder
KOBMAN_SRC_FOLDER="/home/arun/KOBman/src"
echo "$PWD"
export KOBMAN_DIST_FOLDER="/home/arun/KOBman/bin/dist"
echo "moving into dist"
cd $KOBMAN_DIST_FOLDER
echo "dist folder:$KOBMAN_DIST_FOLDER"
echo "$PWD"

##TODO:- archiving using tar command needed

tar -cvf kobman_latest.tar "$KOBMAN_SRC_FOLDER"
cat kobman_latest.tar >> kobman-$KOB_VERSION.tar

echo "adding release repo"
git remote add release https://github.com/asa1997/$KOB_ARCHIVE_DOWLOAD_REPO
echo "adding and commiting installer.sh"

##TODO:- pushing the dist folder to KOBman_website

sudo git add $PWD
# sudo git add KOBman-installer.sh
sudo git commit -m "Update version of $BRANCH to $KOB_VERSION"
# echo "pushing to release master"
 git push release master -f