#!/bin/bash


cd ${KOBMAN_DIR}/tmp
# sudo wget https://github.com/EtricKombat/KOBman/blob/master/releases/kobman-test.zip
# unzip kobman-test.zip

curl --location --progress-bar "${KOBMAN_SERVICE}/${KOBMAN_NAMESPACE}/KOBman/master/releases/kobman-test.zip" > "$kobman_zip_test"

ARCHIVE_OK=$(unzip -qt "$kobman_zip_test" | grep 'No errors detected in compressed data')
if [[ -z "$ARCHIVE_OK" ]]; then
	echo "Downloaded zip archive corrupt. Are you connected to the internet?"
	echo ""
	echo "If problems persist, please ask for help on our Github:"
	echo "* easy sign up: https://github.com/"
	echo "https://github.com/${KOBMAN_NAMESPACE}/KOBman/issues"
	rm -rf "$KOBMAN_DIR"
	exit 2
fi
echo "Extract script archive..."
if [[ "$cygwin" == 'true' ]]; then
	echo "Cygwin detected - normalizing paths for unzip..."
        kobman_zip_test=$(cygpath -w "$kobman_zip_test")
        kobman_stage_folder=$(cygpath -w "$kobman_stage_folder")
fi


unzip -qo "$kobman_zip_test" -d "$kobman_stage_folder"

figlet Upload
figlet Test Functions  
OLD_IFS="$IFS"
IFS=$'\n'
scripts=($(find "${KOBMAN_DIR}/tmp" -type f -name 'test-kob-*'))
for f in "${scripts[@]}"; do
        source "$f"
done
IFS="$OLD_IFS"
unset scripts f 

