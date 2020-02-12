#!/bin/bash
                                                                                                                                   
function __kobman_install_tobvon
{

		
		kobman_namespace="$1"	
		
		sudo figlet Building -f small
		sudo figlet TOB-VON -f small
		sudo figlet from -f small
		sudo figlet ${kobman_namespace} -f small 
		cd ${KOBMAN_CANDIDATES_DIR}
                sudo git clone https://github.com/${kobman_namespace}/von-network.git
                sudo von-network/manage rm
                sudo von-network/manage build

}


function __kobman_start_tobvon
{


	sudo figlet Starting -f small
	sudo figlet TOB-VON -f small
	sudo figlet from -f small
	sudo figlet ${kobman_namespace} -f small 
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo von-network/manage start
}


function __kobman_uninstall_tobvon
{
	sudo figlet TOB-VON -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf von-network/	

}


function __kobman_version_tobvon
{
	figlet Von-Network 
	figlet version 
	cd "${KOBMAN_CANDIDATES_DIR}/von-network/"
	git tag --list v*
}



