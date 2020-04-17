#!/bin/bash


# sudo figlet KOB-Connect -f small
# sudo figlet Memory upload -f small

Function_KOBConnect()
{

		kobman_namespace="$1"
		
		sudo figlet KOB-Connect -f small
		sudo figlet Building -f small
		sudo figlet ${kobman_namespace} -f small		
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/KOBConnect.git
}

fun_uninstall_KOBConnect()
{

	sudo figlet KOB-Connect -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf KOBConnect/
}
