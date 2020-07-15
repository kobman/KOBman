#!/bin/bash

function __kobman_install_KOBman
{
	local environment_name="$1"
	
	local version_id="$2"
	if [[ -z $KOBMAN_ENV_ROOT ]]; then
		export KOBMAN_ENV_ROOT="$HOME/KOBman_env"
	fi
	
	if [[ ! -d $KOBMAN_ENV_ROOT ]]; then
		__kobman_create_fork "${environment_name}" || return 1
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_USER_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment "$environment_name" || return 1
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	else
 		__kobman_echo_white "Removing existing version "
		rm -rf $KOBMAN_ENV_ROOT
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_USER_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		__kobman_create_dev_environment  "$environment_name" || return 1
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	fi

	

}

function __kobman_create_dev_environment 
{
	
	local environment_name=$1
	mkdir -p $KOBMAN_ENV_ROOT
	git clone -q https://github.com/$KOBMAN_USER_NAMESPACE/${environment_name} $KOBMAN_ENV_ROOT/$environment_name
	if [[ ! -d $KOBMAN_ENV_ROOT || ! -d $KOBMAN_ENV_ROOT/$environment_name ]]; then
		__kobman_error_rollback $environment_name
		return 1
	fi
	# export KOBMAN_ROOT_DIR="$HOME/${KOBMAN_ENV_ROOT}"
	mkdir -p ${KOBMAN_ENV_ROOT}/dependency
}

function __kobman_uninstall_KOBman
{
	__kobman_echo_white "Removing dev environment for KOBman"
	rm -rf $KOBMAN_ENV_ROOT
}
