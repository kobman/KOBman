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
 		__kobman_create_dev_environment "$environment_name" "$version_id" || return 1
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	else
 		__kobman_echo_white "Removing existing version "
		rm -rf $KOBMAN_ENV_ROOT
		__kobman_create_dev_environment  "$environment_name" "$version_id" || return 1
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	fi

	

}

function __kobman_create_dev_environment 
{
	
	local environment_name=$1
	local version_id=$2
	__kobman_echo_white "Creating Dev environment for ${environment_name} under $KOBMAN_ENV_ROOT/$environment_name"
	__kobman_echo_white "from https://github.com/${KOBMAN_USER_NAMESPACE}/${environment_name}"
	__kobman_echo_white "version :${version_id} "
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
	local environment=$1
	if [[ ! -d $KOBMAN_ENV_ROOT/$environment ]]; then
		__kobman_echo_no_colour "Could not find $KOBMAN_ENV_ROOT/$environment"
		return 1
	fi
	__kobman_echo_white "Removing dev environment for KOBman"
	# cd $KOBMAN_ENV_ROOT/$environment
	git --git-dir=$KOBMAN_ENV_ROOT/$environment/.git --work-tree=$KOBMAN_ENV_ROOT/$environment status | grep -e "modified" -e "untracked"
	if [[ "$?" == "0" ]]; then
		__kobman_echo_red "You have unsaved works"
		__kobman_echo_red "Uninstalling will remove all of the work done"
		__kobman_interactive_uninstall || return 1
		rm -rf $KOBMAN_ENV_ROOT
	else
		rm -rf $KOBMAN_ENV_ROOT
	fi
	unset KOBMAN_ENV_ROOT

}

function __kobman_validate_KOBman
{
	local environment=$1
	if [[ ! -d $KOBMAN_ENV_ROOT/$environment ]]; then
		__kobman_echo_no_colour "Could not find $KOBMAN_ENV_ROOT/$environment"
		return 1
	fi

	[[ ! -d $KOBMAN_ENV_ROOT/dependency ]] && __kobman_echo_no_colour "Could not find $KOBMAN_ENV_ROOT/dependency" && return 1

	

}

# function __kobman_update_KOBman
# {
# 	##TODO:- add the code for updating KOBman dev
# }

# function __kobman_upgrade_KOBman
# {
# 	##TODO:- add the code for upgradation 
# }

# function __kobman_start_KOBman
# {
# 	##Not Applicable
# }

# function __kobman_stop_KOBman
# {
# 	##Not Applicable
# }
