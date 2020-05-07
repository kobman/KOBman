#!/bin/bash

kob_version="$1"

branch="Release"



# sanityls
if [[ -z "$kob_version" ]]; 
    then
        echo "Usage: release.sh <version>"
 	    exit 0
fi

if [ -z "$KOB_NAMESPACE" ];
    then
        KOB_NAMESPACE=${KOB_NAMESPACE:-hyperledgerkochi}

fi
echo $KOB_NAMESPACE
if [ -z "$KOB_ARCHIVE_DOWNLOAD_REPO" ];
    then
        KOB_ARCHIVE_DOWNLOAD_REPO=${KOB_ARCHIVE_DOWNLOAD_REPO:-KOBman_target_repo}
fi
echo $KOB_ARCHIVE_DOWNLOAD_REPO
if  [ -z "$KOB_DIR" ];
    then
        KOB_DIR=~/KOBman
fi
echo $KOB_DIR
git checkout master
git branch -D $branch
git checkout -b $branch

#copy the tmpl file to /scripts and rename it
cp $KOB_DIR/scripts/tmpl/get.kobman.io.tmpl $KOB_DIR/scripts/
mv $KOB_DIR/scripts/get.kobman.io.tmpl $KOB_DIR/scripts/get.kobman.io
cp $KOB_DIR/scripts/tmpl/README.md.tmpl $KOB_DIR/scripts/
mv $KOB_DIR/scripts/README.md.tmpl $KOB_DIR/scripts/README.md
#replacing variables with actual values
sed -i "s/@KOB_VERSION@/$kob_version/g" $KOB_DIR/scripts/get.kobman.io
sed -i "s/@KOB_ARCHIVE_DOWNLOAD_REPO@/$KOB_ARCHIVE_DOWNLOAD_REPO/g" $KOB_DIR/scripts/get.kobman.io
sed -i "s/@KOB_NAMESPACE@/$KOB_NAMESPACE/g" $KOB_DIR/scripts/get.kobman.io
sed -i "s/@KOB_ARCHIVE_DOWNLOAD_REPO@/$KOB_ARCHIVE_DOWNLOAD_REPO/g" $KOB_DIR/scripts/README.md
sed -i "s/@KOB_NAMESPACE@/$KOB_NAMESPACE/g" $KOB_DIR/scripts/README.md


git add .
git commit -m "Update version of $branch to $version"

#push release branch
git push -f origin "$branch:$branch"

#Push tag 
git tag -a "$kob_version" -m "Releasing version $kob_version"
git push origin $kob_version


git checkout master

