#!/bin/bash
                                                                                                                                   
function __kobman_install_tobvon
{

		
		kobman_namespace="$1"	
		 __kobman_echo_red "Building VON-(TheOrgBook) from ${kobman_namespace}"
		cd ${KOBMAN_CANDIDATES_DIR}
                sudo git clone https://github.com/${kobman_namespace}/von-network.git
                sudo von-network/manage rm
                sudo von-network/manage build

}


function __kobman_start_tobvon
{

	__kobman_echo_red "Starting VON-(TheOrgBook) from ${kobman_namespace}"
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo von-network/manage start
}


function __kobman_uninstall_tobvon
{
 	__kobman_echo_red "VON-(TheOrgBook) - Uninstalling..."	
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo rm -rf von-network/	

}


function __kobman_version_tobvon
{
	kobman_namespace="$1"
        if [ -z "$kobman_namespace" ]; then
                read -p "Enter namespace for Github :" kobman_namespace
	fi	
 	__kobman_echo_red "VON-(TheOrgBook) - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/von-network | grep -o v0.0.*

}



