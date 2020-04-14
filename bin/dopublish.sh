#!/bin/bash

KOB_VERSION=$1
KOB_ARCHIVE_DOWLOAD_REPO="KOBman_website"
BRANCH="master"
#moving into dist folder
cd $PWD/bin/dist/

##TODO:- archiving using tar command needed

tar -cvf kobman_latest.tar /usr/home/KOBman/src
cat kobman_latest.tar >> kobman-$KOB_VERSION.tar

echo "adding release repo"
git remote add release https://github.com/asa1997/$KOB_ARCHIVE_DOWLOAD_REPO
echo "adding and commiting installer.sh"

##TODO:- pushing the dist folder to KOBman_website

sudo git add /bin/dist/
# sudo git add KOBman-installer.sh
sudo git commit -m "Update version of $BRANCH to $KOB_VERSION"
# echo "pushing to release master"
 git push release master -f