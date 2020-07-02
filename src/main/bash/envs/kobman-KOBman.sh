#!/bin/bash

function __kobman_install_KOBman
{
	local environment_name="$1"
	local version_id="$2"

	
	if [[ ! -d ~/Dev_KOBman ]]; then
		__kobman_create_fork "${environment_name}" || return 1
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment "${environment_name}"
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	else
 		__kobman_echo_white "Removing existing version "
		rm -rf ~/Dev_${environment_name}
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment "${environment_name}"
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	fi

	

}

function __kobman_create_dev_environment 
{
	local environment="$1"
	mkdir -p ~/Dev_$environment
	git clone -q https://github.com/$KOBMAN_NAMESPACE/${environment_name} ~/Dev_$environment/$environment
	export Dev_${environment}="~/Dev_${environment}"
	mkdir -p ~/Dev_"${environment}"/test
	mkdir -p ~/Dev_"${environment}"/dependency
}

function __kobman_uninstall_KOBman
{
	__kobman_echo_white "Removing dev environment for KOBman"
	rm -rf ~/Dev_KOBman
}
