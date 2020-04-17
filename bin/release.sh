#!/bin/bash

KOB_VERSION="$1"

BRANCH="tag"

KOB_ARCHIVE_DOWLOAD_REPO="KOBman_website"

KOBMAN_NAMESPACE="asa1997"

#sanityls
if [[ -z "$VERSION" ]]; 
    then
        echo "Usage: release.sh <version>"
 	    exit 0
fi

echo "$KOB_VERSION"
#prepare branch
# echo "prepare branch"
# #git fetch
git checkout Dev
git branch -D "$BRANCH"
git checkout -b "$BRANCH"

#copy the tmpl file to /scripts
echo "copying tmpl file to scripts"
cp ~/dev_branch/KOBman/scripts/tmpl/get.kobman.io.tmpl ~/dev_branch/KOBman/scripts/

mv ~/dev_branch/KOBman/scripts/get.kobman.io.tmpl ~/dev_branch/KOBman/scripts/get.kobman.io

#replacing variables with actual values
echo "updating variables"
sed -i "s/@KOB_VERSION@/$KOB_VERSION/g" ~/dev_branch/KOBman/scripts/get.kobman.io
sed -i "s/@KOB_ARCHIVE_DOWLOAD_REPO@/$KOB_ARCHIVE_DOWLOAD_REPO/g" ~/dev_branch/KOBman/scripts/get.kobman.io
sed -i "s/@KOB_NAMESPACE@/$KOBMAN_NAMESPACE/g" ~/dev_branch/KOBman/scripts/get.kobman.io

#Tagging 
echo "tagging"
git tag -a "$KOB_VERSION" -m "Releasing version $KOB_VERSION"
echo "pushing version"
git push origin $KOB_VERSION

#pushing get.kobman.io to repo
# sudo git add ~/dev_branch/KOBman/scripts/get.kobman.io
# sudo git commit -m "variables updated"
# sudo git push dev Dev

git -d branch $BRANCH
