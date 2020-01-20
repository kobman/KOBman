#!/bin/bash

 
                                                          


function __kobman_install_kob
{

		
		kobman_namespace="$1"
		sudo figlet KochiOrgBook -f small
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

function __kobman_start_kob
{
	
	sudo figlet KochiOrgBook -f small
	sudo figlet Starting.. -f small
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo TheOrgBook/docker/manage start seed=the_org_book_0000000000000000000
}

function __kobman_uninstall_kob
{
	
	sudo figlet KochiOrgBook -f small
	sudo figlet Removing... -f small
	
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo TheOrgBook/docker/manage rm
        sudo rm -rf TheOrgBook/ /usr/local/bin/sti /usr/local/bin/s2i source-to-image-v1.1.14-874754de-linux-amd64.tar.gz

}
