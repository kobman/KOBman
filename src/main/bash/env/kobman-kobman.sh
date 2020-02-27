#!/bin/bash

function __kobman_development_kobman_dir {



	Repo_name=${3:-KOBman}
	__kobman_echo_red "KOBman development environment setting up at /usr/home/kobman_dev_dir "
	cd "${KOBMAN_DEV_DIR}"
	sudo mkdir -p "${Repo_name}"_dev_dir
	cd "${Repo_name}"_dev_dir
	kobman_tob_dev_dir="${PWD}"	
	sudo mkdir -p test/ dependency/
	sudo git clone https://github.com/EtricKombat/${Repo_name}




} 
