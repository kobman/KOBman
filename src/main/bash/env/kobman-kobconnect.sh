#!/bin/bash


function __kobman_install_kobconnect
{

		kobman_namespace="$1"
		
		sudo figlet KOB-Connect -f small
		sudo figlet Building -f small
		sudo figlet ${kobman_namespace} -f small		
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/KOBConnect.git
}

function __kobman_uninstall_kobconnect
{

	sudo figlet KOB-Connect -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf KOBConnect/
}
