#!/bin/bash 


function __kobman_development_greenlight_dir {



	Repo_name=${3:-greenlight}
	cd ${KOBMAN_DEV_DIR}
	echo "greenlight dir path"	
	echo ${KOBMAN_DEV_DIR}



	sudo mkdir -p greenlight_dev_dir
	cd greenlight_dev_dir

	#sudo mkdir -p "${Repo_name}"_dev_dir
	#cd "${Repo_name}"_dev_dir
	kobman_greenlight_dev_dir="${PWD}"	
	__kobman_echo_red "KOBman development environment setting up at $kobman_kobman_dev_dir "
	sudo mkdir -p test/ dependency/
	sudo git clone https://github.com/EtricKombat/${Repo_name}




}


function __kobman_install_greenlight
{
		kobman_namespace="$1"
 		__kobman_echo_green "Building greenlight from ${kobman_namespace}"	
               	sudo chmod 755 ${KOBMAN_CANDIDATES_DIR} 
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

 	__kobman_echo_green "Starting greenlight from ${kobman_namespace}"	
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
 	cd ${KOBMAN_CANDIDATES_DIR}
        sudo greenlight/docker/manage start
}

function __kobman_uninstall_greenlight
{
	
	sudo chmod 777 ${KOBMAN_CANDIDATES_DIR}
 	__kobman_echo_green "Greenlight - Uninstalling..."
	cd ${KOBMAN_CANDIDATES_DIR}
	sudo greenlight/docker/manage rm
	sudo rm -rf greenlight/ 2> /dev/null	
#	sudo rm ${KOBMAN_CANDIDATES_DIR}/source-*
	sudo rm -rf greenlight/ /usr/local/bin/sti /usr/local/bin/s2i source-to-image-v1.1.14-874754de-linux-amd64.tar.gz 2> /dev/null	
}

function __kobman_version_greenlight
{
	kobman_namespace="$1"
        if [ -z "$kobman_namespace" ]; then
                read -p "Enter namespace for Github :" kobman_namespace
       	fi 
 	__kobman_echo_green "Greenlight - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/greenlight | grep -o v0.0.*

}


