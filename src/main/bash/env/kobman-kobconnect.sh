#!/bin/bash


function __kobman_install_kobconnect
{

		kobman_namespace="$1"
		sudo figlet Building -f small
		sudo figlet KOB-Connect -f small
		sudo figlet from -f small
		sudo figlet ${kobman_namespace} -f small		
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/KOBConnect.git
}

function __kobman_uninstall_kobconnect
{
	sudo figlet Uninstalling -f small
	sudo figlet KOB-Connect -f small
	sudo figlet from -f small
	sudo figlet ${kobman_namespace} -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf KOBConnect/

}


function __kobman_version_kobconnect
{
	figlet kobconnect
	figlet 0.01

}
