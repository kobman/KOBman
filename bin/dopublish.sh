#!/bin/bash

##TODO:- archiving using tar command needed

echo "adding release repo"
git remote add release https://github.com/asa1997/$KOB_ARCHIVE_DOWLOAD_REPO
echo "adding and commiting installer.sh"

##TODO:- pushing the dist folder to KOBman_website
# sudo git add KOBman-installer.sh
# sudo git commit -m "Update version of $BRANCH to $KOB_VERSION"
# echo "pushing to release master"
# git push release master -f