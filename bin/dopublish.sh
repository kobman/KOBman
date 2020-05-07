#!/bin/bash

kob_rel_version=$1

if [ -z "$KOB_ARCHIVE_DOWNLOAD_REPO" ];
    then
        KOB_ARCHIVE_DOWNLOAD_REPO=${KOB_ARCHIVE_DOWNLOAD_REPO:-KOBman_target_repo}
fi
echo $KOB_ARCHIVE_DOWNLOAD_REPO
if  [ -z "$KOB_DIR" ];
    then
        KOB_DIR=~/KOBman
fi

if [ -z "$KOB_NAMESPACE" ];
    then
        KOB_NAMESPACE=${KOB_NAMESPACE:-hyperledgerkochi}

fi

echo $KOB_NAMESPACE
#Checkout latest tag
git checkout tags/$kob_rel_version -b $kob_rel_version


mkdir $KOB_DIR/tmp
cd $KOB_DIR/tmp
git clone https://github.com/$KOB_NAMESPACE/$KOB_ARCHIVE_DOWNLOAD_REPO
mkdir $KOB_DIR/tmp/$KOB_ARCHIVE_DOWNLOAD_REPO/dist

echo "making the tar files..."
tar -cvf $KOB_DIR/tmp/$KOB_ARCHIVE_DOWNLOAD_REPO/dist/kobman-latest.tar $KOB_DIR/src/ $KOB_DIR/bin/
cp $KOB_DIR/tmp/$KOB_ARCHIVE_DOWNLOAD_REPO/dist/kobman-latest.tar $KOB_DIR/bin/kobman-$kob_rel_version.tar


#Moving necessary files to the target repo
mv $KOB_DIR/scripts/* $KOB_DIR/tmp/$KOB_ARCHIVE_DOWNLOAD_REPO/dist


cd $KOB_DIR/tmp/$KOB_ARCHIVE_DOWNLOAD_REPO/
git pull 
echo "saving changes and pushing"
git add .
git commit -m "Released the version $kob_rel_version"
git push origin master -f

cd $KOB_DIR
rm -rf tmp/$KOB_ARCHIVE_DOWNLOAD_REPO tmp/

git checkout master

git branch -D $kob_rel_version



