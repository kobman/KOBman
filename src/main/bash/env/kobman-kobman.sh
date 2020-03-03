#!/bin/bash
function __kobman_development_kobman_dir {

	cd ~
	sudo mkdir -p DevDir_KOBman
	cd DevDir_KOBman
	export KOBMAN_KOBMAN_DEV_DIR=$PWD
	__kobman_echo_red "KOBman development environment setting up at  "
	__kobman_echo_red "${KOBMAN_KOBMAN_DEV_DIR}"
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
}

function __kobman_uninstall_kobman
{
 	__kobman_echo_green "KOBman - Uninstalling..."
       	cd ${KOBMAN_KOBMAN_DEV_DIR} 

	echo "before "  
        pwd
        cd ~
        echo "after"
        pwd
        sudo rm -rf DevDir_KOBman 2> /dev/null

}

function __kobman_version_kobman
{
	kobman_namespace="$1"
        if [ -z "$kobman_namespace" ]; then
                read -p "Enter namespace for Github : " kobman_namespace
       	fi 
 	__kobman_echo_green "KOBman - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/KOBman | grep -o v0.0.*
}

