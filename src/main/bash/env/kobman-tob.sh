#!/bin/bash 
                                                              
                                                              

function __kobman_install_tob
{
	        kobman_namespace="$1"
		sudo figlet TOB-TheOrgBook -f small
		sudo figlet Building -f small
		sudo figlet ${kobman_namespace} -f small 
                cd ${KOBMAN_CANDIDATES_DIR}
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


	sudo figlet TOB-TheOrgBook -f small
	sudo figlet Starting -f small
	sudo chmod a+rwx ${KOBMAN_CANDIDATES_DIR}
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo TheOrgBook/docker/manage start seed=the_org_book_0000000000000000000
}

function __kobman_uninstall_tob
{
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
	sudo figlet TOB-TheOrgBook -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo TheOrgBook/docker/manage rm
	sudo rm ${KOBMAN_CANDIDATES_DIR}/source-*
	sudo rm -rf TheOrgBook/ 2> /dev/null 	
	sudo rm -rf /usr/local/bin/s2i /usr/local/bin/sti TheOrgBook/ 2> /dev/null	
}	
