#!/bin/bash

kob_rel_version=$1
#kob_archive_download_repo="KOBman_target_repo"
kob_rel_stage_area=~/tmp
#kob_namespace="asa1997"

#source $HOME/$USR/KOBman/bin/release_var_setup.sh

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

echo "making the tar files..."
tar -cvf $KOB_DIR/bin/kobman-latest.tar $KOB_DIR/src/ $KOB_DIR/bin/
cp $KOB_DIR/bin/kobman-latest.tar $KOB_DIR/bin/kobman-$kob_rel_version.tar


mkdir $kob_rel_stage_area
cd $kob_rel_stage_area
git clone https://github.com/$KOB_NAMESPACE/$KOB_ARCHIVE_DOWNLOAD_REPO
mkdir $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO/dist

#Moving necessary files to the target repo
mv $KOB_DIR/bin/kobman*.tar $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO/dist
mv $KOB_DIR/scripts/get.kobman.io $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO/dist
mv $KOB_DIR/scripts/README.md $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO/dist


cd $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO/
git pull 
echo "saving changes and pushing"
git add .
git commit -m "Released the version $kob_rel_version"
git push origin master -f

cd $KOB_DIR
rm -rf $kob_rel_stage_area/$KOB_ARCHIVE_DOWNLOAD_REPO $kob_rel_stage_area

git checkout master
git merge $kob_rel_version
git branch -D $kob_rel_version


