#!/bin/bash 


# sudo figlet KOB-Registery -f small 
# sudo figlet Memory upload -f small 

Function_KOBRegistery()
{


		kobman_namespace="$1"		
	
		sudo figlet KOB-Registery -f small	
		sudo figlet Build -f small	
		sudo figlet ${kobman_namespace} -f small  	
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/KOBRegistry.git
}

fun_uninstall_KOBRegistery()
{
	sudo figlet KOB-Registery -f small
	sudo figlet Removing.. -f small
	
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf KOBRegistry/

}
