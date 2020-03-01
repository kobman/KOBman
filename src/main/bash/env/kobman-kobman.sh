#!/bin/bash

function __kobman_development_kobman_dir {



	echo "KOBman dir path"	
	sudo mkdir -p DevDir_KOBman
	cd DevDir_KOBman
	export KOBMAN_KOBMAN_DEV_DIR=$PWD
	__kobman_echo_red "KOBman development environment setting up at  ${KOBMAN_KOBMAN_DEV_DIR}"
	sudo mkdir -p test/ dependency/
}



function __kobman_install_kobman
{
		kobman_namespace="$1"
 		__kobman_echo_green "Building kobman from ${kobman_namespace}"	
               	sudo chmod 755 ${KOBMAN_CANDIDATES_DIR} 
		cd ${KOBMAN_CANDIDATES_DIR}
         	__kobman_development_kobman_dir 
		sudo git clone https://github.com/${kobman_namespace}/KOBman.git

		cd ~

}


function __kobman_uninstall_kobman
{
	
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
 	__kobman_echo_green "KOBman - Uninstalling..."
       	cd ${KOBMAN_KOBMAN_DEV_DIR} 
	sudo kobman/docker/manage rm
	sudo rm -rf kobman/ 2> /dev/null	

       	rm -rf  ${KOBMAN_KOBMAN_DEV_DIR}
	cd ~
}

function __kobman_version_kobman
{
	kobman_namespace="$1"
        if [ -z "$kobman_namespace" ]; then
                read -p "Enter namespace for Github :" kobman_namespace
       	fi 
 	__kobman_echo_green "KOBman - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/KOBman | grep -o v0.0.*

}



