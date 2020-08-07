#!/bin/bash
function __kobman_install_Aries-Cloudagent-Python
{
    local environment=$1
    local version=$2
    if [[ -z $KOBMAN_ARIES_ENV_ROOT ]]; then
        export KOBMAN_ARIES_ENV_ROOT=$HOME/Aries-Cloudagent-Python_dev
    fi

    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
		__kobman_create_fork "${environment}" || return 1
		__kobman_echo_white "Installing aries-cloudagent"
		pip install aries-cloudagent
		__kobman_create_aries_dev_environment "$environment" "$version" || return 1
		
	else
 		__kobman_echo_white "Removing existing version "
		rm -rf $KOBMAN_ARIES_ENV_ROOT
		__kobman_create_dev_environment "$environment" "$version" || return 1
	fi
}

function __kobman_create_aries_dev_environment 
{
	
	local environment=$1
    local version=$2
    __kobman_echo_white "Creating Dev environment for ${environment} under $KOBMAN_ARIES_ENV_ROOT/$environment"
    __kobman_echo_white "from https://github.com/${KOBMAN_USER_NAMESPACE}/${environment}"
    __kobman_echo_white "version :${version} "
	mkdir -p $KOBMAN_ARIES_ENV_ROOT
	git clone -q https://github.com/$KOBMAN_USER_NAMESPACE/${environment} $KOBMAN_ARIES_ENV_ROOT/$environment
	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT || ! -d $KOBMAN_ARIES_ENV_ROOT/$environment ]]; then
		__kobman_error_rollback $environment
		return 1
	fi
	# export KOBMAN_ROOT_DIR="$HOME/${KOBMAN_ARIES_ENV_ROOT}"
	mkdir -p ${KOBMAN_ARIES_ENV_ROOT}/dependency
    __kobman_echo_violet "Dev environment for ${environment} created successfully"
}

function __kobman_uninstall_Aries-Cloudagent-Python
{
    local environment=$1
    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/$environment ]]; then
		__kobman_echo_no_colour "Could not find $KOBMAN_ARIES_ENV_ROOT/$environment"
		return 1
	fi
	__kobman_echo_white "Removing dev environment for KOBman"
	# cd $KOBMAN_ARIES_ENV_ROOT/$environment
	git --git-dir=$KOBMAN_ARIES_ENV_ROOT/$environment/.git --work-tree=$KOBMAN_ARIES_ENV_ROOT/$environment status | grep -e "modified" -e "untracked"
	if [[ "$?" == "0" ]]; then
		__kobman_echo_red "You have unsaved works"
		__kobman_echo_red "Uninstalling will remove all of the work done"
		__kobman_interactive_uninstall || return 1
		rm -rf $KOBMAN_ARIES_ENV_ROOT
	else
		rm -rf $KOBMAN_ARIES_ENV_ROOT
	fi
}

function __kobman_validate_Aries-Cloudagent-Python
{
	environment=$1
	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
		__kobman_echo_no_colour "Could not find dev environment for $environment"
		return 1
	fi

	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/$environment ]]; then
		__kobman_echo_no_colour "Could not find $environment folder under $KOBMAN_ARIES_ENV_ROOT"
		return 1
	fi

	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/dependency ]]; then
		__kobman_echo_no_colour "Could not find dependency folder for $environment under $KOBMAN_ARIES_ENV_ROOT"
		return 1
	fi
}

# function __kobman_update_Aries-Cloudagent-Python
# {
# 	TODO: Add code for updation
# }

# function __kobman_upgrade_Aries-Cloudagent-Python
# {
# 	TODO: Add code for upgrade
# }

# function __kobman_start_Aries-Cloudagent-Python
# {
# 	TODO: Add code for starting the environment
# }

# function __kobman_stop_Aries-Cloudagent-Python
# {
# 	TODO: Add code for stop
# }


