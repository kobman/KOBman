#!/bin/bash

function __kobman_development_kobman_dir {



	Repo_name=${3:-KOBman}
	
	cd ${KOBMAN_DEV_DIR}
	echo "KOBman dir path"	
	echo ${KOBMAN_DEV_DIR}
	

	sudo mkdir -p KOBman_dev_dir
	cd KOBman_dev_dir

	#sudo mkdir -p "${Repo_name}"_dev_dir
	#cd "${Repo_name}"_dev_dir
	kobman_kobman_dev_dir="${PWD}"	
	__kobman_echo_red "KOBman development environment setting up at $kobman_kobman_dev_dir "
	sudo mkdir -p test/ dependency/
	sudo git clone https://github.com/EtricKombat/${Repo_name}




} 
