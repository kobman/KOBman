#!/bin/bash 
                                                              
function __kobman_development_tob_dir {

	sudo mkdir -p DevDir_TOB
	cd DevDir_TOB
	export KOBMAN_TOB_DEV_DIR=$PWD
	__kobman_echo_red "TheOrgBook development environment setting up at  "
	__kobman_echo_red " ${KOBMAN_TOB_DEV_DIR}  "
	sudo mkdir -p test/ dependency/

                                                            
}
function __kobman_install_tob
{
	        kobman_namespace="$1"
                __kobman_echo_cyan "Building TheOrgBook from"
                __kobman_echo_cyan "${kobman_namespace}"
		cd ${KOBMAN_CANDIDATES_DIR}
         	__kobman_development_tob_dir 
		sudo git clone https://github.com/${kobman_namespace}/TheOrgBook.git
                sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
                sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
                sudo mv s2i sti /usr/local/bin/
                sudo TheOrgBook/docker/manage rm
                sudo TheOrgBook/docker/manage build
                sudo sed -i -e 's/- 3000/- 3100/g' TheOrgBook/docker/docker-compose.yml


}

function __kobman_start_tob
{


	__kobman_echo_cyan "Starting TheOrgBook from "	
	__kobman_echo_cyan "${kobman_namespace}"	
	cd ${KOBMAN_TOB_DEV_DIR}
	sudo TheOrgBook/docker/manage start seed=the_org_book_0000000000000000000
}

function __kobman_uninstall_tob
{
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
 	__kobman_echo_cyan "TheOrgBook - Uninstalling..."	
	cd ${KOBMAN_TOB_DEV_DIR}
	sudo TheOrgBook/docker/manage rm 2> /dev/null	

	sudo rm ${KOBMAN_TOB_DEV_DIR}/source-* 2> /dev/null	

	sudo rm -rf TheOrgBook/ 2> /dev/null 	
	sudo rm -rf /usr/local/bin/s2i /usr/local/bin/sti TheOrgBook/ 2> /dev/null	
	cd ~
	rm -rf ${KOBMAN_TOB_DEV_DIR}
}	

function __kobman_version_tob
{
	
	kobman_namespace="$1"
	if [ -z "$kobman_namespace" ]; then
		read -p "Enter namespace for Github :" kobman_namespace	
	fi	
 	__kobman_echo_cyan "TheOrgBook - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/TheOrgBook | grep -o v0.0.*


}



