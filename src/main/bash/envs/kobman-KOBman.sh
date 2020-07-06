#!/bin/bash

function __kobman_install_KOBman
{
	local environment_name="$1"
	local dev_area_name="Dev_$environment_name"
	local version_id="$2"

	
	if [[ ! -d $HOME/$dev_area_name ]]; then
		__kobman_create_fork "${environment_name}" || return 1
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment "${dev_area_name}" "$environment_name"
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	else
 		__kobman_echo_white "Removing existing version "
		rm -rf $HOME/$dev_area_name
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment "${dev_area_name}"
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	fi

	

}

function __kobman_create_dev_environment 
{
	local dev_area_name="$1"
	local environment_name=$2
	mkdir -p $HOME/$dev_area_name
	git clone -q https://github.com/$KOBMAN_NAMESPACE/${environment_name} $HOME/$dev_area_name/$environment_name
	export ${dev_area_name}="$HOME/${dev_area_name}"
	mkdir -p $HOME/"${dev_area_name}"/test
	mkdir -p $HOME/"${dev_area_name}"/dependency
}

function __kobman_uninstall_KOBman
{
	local dev_area_name="Dev_$1"
	__kobman_echo_white "Removing dev environment for KOBman"
	rm -rf $HOME/$dev_area_name
}
