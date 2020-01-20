#!/bin/bash 



function __kobman_install_kobregistery
{


		kobman_namespace="$1"		
	
		sudo figlet KOB-Registery -f small	
		sudo figlet Build -f small	
		sudo figlet ${kobman_namespace} -f small  	
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/KOBRegistry.git
}

function __kobman_uninstall_kobregistery
{
	sudo figlet KOB-Registery -f small
	sudo figlet Removing.. -f small
	
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf KOBRegistry/

}
