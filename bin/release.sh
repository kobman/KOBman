#!/bin/bash

KOB_VERSION="$1"

BRANCH="production"

KOB_ARCHIVE_DOWLOAD_REPO="KOBman_website"

KOBMAN_NAMESPACE="asa1997"

#sanityls
# if [[ -z "$VERSION" ]]; then
# 	echo "Usage: release.sh <version>"
# 	exit 0
# fi

echo "$KOB_VERSION"
#prepare branch
# echo "prepare branch"
# #git fetch
# git checkout master
# git branch -D "$BRANCH"
# git checkout -b "$BRANCH"

#moving into distributions folder
# mkdir $PWD/bin/dist
# cd dist
# cp $PWD/tmpl/get.kobman.io.tmpl $PWD/bin/dist/
cd $PWD/bin/dist
#replacing variables with actual values
echo "updating variables"
sed -i "s/@KOB_VERSION@/$KOB_VERSION/g" $PWD/get.kobman.io.tmpl
sed -i "s/@KOB_ARCHIVE_DOWLOAD_REPO@/$KOB_ARCHIVE_DOWLOAD_REPO/g" $PWD/get.kobman.io.tmpl
sed -i "s/@KOB_NAMESPACE@/$KOBMAN_NAMESPACE/g" $PWD/get.kobman.io.tmpl
echo "tagging"
git tag "$KOB_VERSION"
echo "pushing version"
git push origin $KOB_VERSION

