#!/bin/bash 
                                                              
                                                              
function __kobman_development_greenlight_dir
{
	Repo_name=${3:-greenlight}
	cd "${KOBMAN_DEV_DIR}"
	sudo mkdir -p "${Repo_name}"_dev_dir
	cd "${Repo_name}"_dev_dir
	kobman_greenlight_dev_dir="${PWD}"	

	__kobman_echo_red "greenlight development environment setting up at $kobman_greenlight_dev_dir"
	sudo mkdir -p test/ dependency/
	sudo git clone https://github.com/EtricKombat/${Repo_name}



}

function __kobman_install_greenlight
{
	kobman_namespace="$1"
	sudo figlet Building -f small
	sudo figlet greenlight -f small
	sudo figlet from -f small
	sudo figlet ${kobman_namespace} -f small 
        cd ${KOBMAN_CANDIDATES_DIR}
        sudo git clone https://github.com/${kobman_namespace}/greenlight.git
        sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
        sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
        sudo mv s2i sti /usr/local/bin/
        sudo greenlight/docker/manage rm
        sudo greenlight/docker/manage build


}

function __kobman_start_greenlight
{
	sudo figlet Starting -f small
	sudo figlet greenlight -f small
	sudo figlet from -f small
	sudo figlet ${kobman_namespace} -f small
	sudo chmod a+rwx ${KOBMAN_CANDIDATES_DIR}
	cd ${KOBMAN_CANDIDATES_DIR}
        sudo greenlight/docker/manage start
}

function __kobman_uninstall_greenlight
{
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
	sudo figlet TOB-greenlight -f small
	sudo figlet Removing -f small
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo greenlight/docker/manage rm
	sudo rm ${KOBMAN_CANDIDATES_DIR}/source-*
	sudo rm -rf greenlight/ 2> /dev/null 	
	sudo rm -rf /usr/local/bin/s2i /usr/local/bin/sti greenlight/ 2> /dev/null	

}	

function __kobman_version_greenlight
{
	figlet greenlight 
	figlet 0.01

}

