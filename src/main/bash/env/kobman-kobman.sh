#!/bin/bash
function __kobman_development_kobman_dir {

	cd ~
	sudo mkdir -p DevDir_KOBman
	cd DevDir_KOBman
	export KOBMAN_KOBMAN_DEV_DIR=$PWD
	sudo chmod 777 ${KOBMAN_KOBMAN_DEV_DIR}
	cd ${KOBMAN_KOBMAN_DEV_DIR}
	sudo mkdir -p test/ dependency/
}

function __kobman_install_kobman
{
		kobman_namespace="$1"
 		__kobman_echo_green "Building kobman from"	
 		__kobman_echo_green "${kobman_namespace}"	
		cd ${KOBMAN_CANDIDATES_DIR}
         	__kobman_development_kobman_dir 
		sudo git clone https://github.com/${kobman_namespace}/KOBman.git
		cd ~
		cd ${KOBMAN_CANDIDATES_DIR}
}

function __kobman_uninstall_kobman
{
 	__kobman_echo_green "KOBman - Uninstalling..."
 
	cd ${KOBMAN_KOBMAN_DEV_DIR} 
	sudo rm -rf KOBman/ 2> /dev/null	
	cd ~
	sudo rm -rf ${KOBMAN_KOBMAN_DEV_DIR} 2> /dev/null	
        cd ~
}

function __kobman_version_kobman
{
	kobman_namespace=$KOBMAN_NAMESPACE
	echo "KOBMAN NAMESPACE= $KOBMAN_NAMESPACE"
	echo "kobman namespace= ${kobman_namespace}"
#        if [ -z "$kobman_namespace" ]; then
#                read -p "Enter namespace for Github : " kobman_namespace
#       	fi 
# 	__kobman_echo_green "KOBman - Version"	
	sudo git ls-remote --tags https://github.com/${kobman_namespace}/KOBman | grep -o v0.0.*
}

