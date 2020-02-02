#!/bin/bash 


function __kobman_install_kobvon
{

		kobman_namespace="$1"
 	
		
		sudo figlet Building -f small
		sudo figlet KOBVON -f small
		sudo figlet from -f small
		sudo figlet ${kobman_namespace} -f small  
		cd ${KOBMAN_CANDIDATES_DIR}
                sudo git clone https://github.com/${kobman_namespace}/von-network.git
                sudo von-network/manage rm
                sudo von-network/manage build

}

function __kobman_start_kobvon
{


 	sudo figlet Starting -f small
	sudo figlet KOBVON -f small
	sudo figlet from -f small
	sudo figlet ${kobman_namespace} -f small  
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo von-network/manage start
}

function __kobman_uninstall_kobvon
{
 	sudo figlet KOB-VON -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo von-network/manage start
	sudo von-network/manage rm
	sudo rm -rf von-network/

}

function __kobman_version_kobvon
{
	figlet kobvon
	figlet 0.01

}
