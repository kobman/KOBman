#!/bin/bash


function __kob_status {

sudo rm ${KOBMAN_CANDIDATES_DIR}/*.tar.gz 2> /dev/null
sudo rm ${KOBMAN_CANDIDATES_DIR}/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz.* 2> /dev/null
sudo figlet status -f small
sudo ls ${KOBMAN_CANDIDATES_DIR}
# echo "env variable print"
# tree ${KOBMAN_CANDIDATES_DIR}

#	figlet memory upload of 
#	figlet kobman-status.sh
#
#	if [ -d "${KOBMAN_DIR}/env/von-network" ] 
#	then
#		figlet tob von
#		figlet available		
#	else
#		figlet tob von
#		figlet not-available		
#	fi
#
#
#
#	if [ -d "${KOBMAN_DIR}/env/TheOrgBook" ] 
#	then
#		figlet tob 
#		figlet available		
#	else
#		figlet tob 
#	figlet not-available		
#	fi
#
#	if [ -d "${KOBMAN_DIR}/env/greenlight" ]
#	then
#		figlet tob greenlight 
#		figlet available		
#	else
#		figlet greenlight  
#		figlet not-available		
#	fi
#
}
