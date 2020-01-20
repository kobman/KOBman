#!/bin/bash 


function __kobman_install_kobdflow
{
		kobman_namespace="$1"

		sudo figlet KOB-Dflow
		sudo figlet Building -f small
		sudo figlet ${kobman_namespace} -f small  
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo git clone https://github.com/${kobman_namespace}/greenlight.git
                sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
                sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
                sudo mv s2i sti /usr/local/bin/
                sudo greenlight/docker/manage rm
                sudo greenlight/docker/manage build

}

function __kobman_start_kobdflow
{

	sudo figlet KOB-Dflow -f small
	sudo figlet Starting -f small

        if [ "$reply" = "y" ] || [ "$reply" = "Y" ] || [ "$reply" = "yes" ] || [ "$reply" = "YES" ];
        then
		cd ${KOBMAN_CANDIDATES_DIR}
		sudo greenlight/docker/manage start
        fi
}

function __kobman_uninstall_kobdflow
{
	sudo figlet KOB-Dflow -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo greenlight/docker/manage rm	
	sudo rm -rf greenlight/ /usr/local/bin/s2i /usr/local/bin/sti source-to-image-v1.1.14-874754de-linux-amd64.tar.gz 

}
