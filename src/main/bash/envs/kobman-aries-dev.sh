#!/bin/bash
function __kobman_install_aries-dev
{
    local environment=$1
    local version=$2
    if [[ -z $KOBMAN_ARIES_ENV_ROOT ]]; then
        export KOBMAN_ARIES_ENV_ROOT=$HOME/Aries_dev
    fi
    check_python3_installation
    check_pip_installation
    __kobman_echo_white "Installing $environment environment"
    pip3 install aries-cloudagent
    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
		# __kobman_create_fork "${environment}" || return 1

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
    __kobman_echo_white "Creating Dev environment for ${environment} under $KOBMAN_ARIES_ENV_ROOT"
    # __kobman_echo_white "from https://github.com/${KOBMAN_USER_NAMESPACE}/${environment}"
    __kobman_echo_white "version :${version} "
	mkdir -p $KOBMAN_ARIES_ENV_ROOT
	# git clone -q https://github.com/$KOBMAN_USER_NAMESPACE/${environment} $KOBMAN_ARIES_ENV_ROOT/$environment
	# if [[ ! -d $KOBMAN_ARIES_ENV_ROOT || ! -d $KOBMAN_ARIES_ENV_ROOT/$environment ]]; then
	# 	__kobman_error_rollback $environment
	# 	return 1
	# fi
	# export KOBMAN_ROOT_DIR="$HOME/${KOBMAN_ARIES_ENV_ROOT}"
	mkdir -p ${KOBMAN_ARIES_ENV_ROOT}/dependency
    touch ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt
    add_aries_requirements > ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt
	mkdir -p ${KOBMAN_ARIES_ENV_ROOT}/src
    __kobman_echo_violet "Dev environment for ${environment} created successfully"
}

function add_aries_requirements(){
cat<<EOF
aiohttp~=3.6.2
aiohttp-apispec==2.2.1
aiohttp-cors~=0.7.0
apispec~=3.3.0
async-timeout~=3.0.1
base58~=2.0.0
Markdown~=3.1.1
marshmallow==3.5.1
msgpack~=0.6.1
prompt_toolkit~=2.0.9
pynacl~=1.3.0
requests~=2.23.0
pyld==2.0.1    
EOF
}

function __kobman_uninstall_aries-dev
{
    local environment=$1
    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
		__kobman_echo_no_colour "Could not find $KOBMAN_ARIES_ENV_ROOT"
		return 1
	else
        __kobman_echo_white "Uninstalling dependencies..."
        pip3 uninstall --no-cache-dir -r ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt -y
        pip3 uninstall aries-cloudagent -y
        __kobman_echo_white "Removing dev environment for Aries"
        rm -rf $KOBMAN_ARIES_ENV_ROOT
		unset KOBMAN_ARIES_ENV_ROOT
    fi
	
	# cd $KOBMAN_ARIES_ENV_ROOT/$environment
	# git --git-dir=$KOBMAN_ARIES_ENV_ROOT/$environment/.git --work-tree=$KOBMAN_ARIES_ENV_ROOT/$environment status | grep -e "modified" -e "untracked"
	# if [[ "$?" == "0" ]]; then
	# 	__kobman_echo_red "You have unsaved works"
	# 	__kobman_echo_red "Uninstalling will remove all of the work done"
	# 	__kobman_interactive_uninstall || return 1
		# rm -rf $KOBMAN_ARIES_ENV_ROOT
	# else
	# 	rm -rf $KOBMAN_ARIES_ENV_ROOT
	# fi
}
function check_python3_installation
{
    __kobman_echo_no_colour "Checking python installation"
    if [[ -z $(which python3) ]]; then
        __kobman_echo_no_colour "Installing python3"
        sudo apt-get update
        sudo apt-get install python3.6
    fi
}
function check_pip_installation
{
    __kobman_echo_no_colour "Checking pip installation"
    if [[ -z $(which pip3) ]]; then
        __kobman_echo_no_colour "Installing pip3"
        sudo sudo apt-get install python3-pip
    else
        __kobman_echo_no_colour "Attempting to upgrade pip"
        python3 -m pip install --user --upgrade pip
    fi
}

function __kobman_validate_aries-dev
{
	local environment=$1
	
	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
		__kobman_echo_no_colour "Could not find dev environment for $environment"
		return 1
	fi

	# if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/$environment ]]; then
	# 	__kobman_echo_no_colour "Could not find $environment folder under $KOBMAN_ARIES_ENV_ROOT"
	# 	return 1
	# fi

	if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/dependency ]]; then
		__kobman_echo_no_colour "Could not find dependency folder for $environment under $KOBMAN_ARIES_ENV_ROOT"
		return 1
	fi

    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT/src ]]; then
		__kobman_echo_no_colour "Could not find src folder for $environment under $KOBMAN_ARIES_ENV_ROOT"
		return 1
	fi

	if [[ ! -f ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt ]]; then
		__kobman_echo_no_colour "Could not find file ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt"
		return 1
	fi
	ls $HOME/.local/lib/python3.6/site-packages | sort >> $HOME/files_to_compare.txt
	# sort $HOME/files_to_compare.txt >> $HOME/sorted_files_to_compare.txt
	sort ${KOBMAN_ARIES_ENV_ROOT}/dependency/requirements.txt >> $HOME/sorted_requirements.txt
	comm -2 $HOME/sorted_requirements.txt $HOME/files_to_compare.txt >> $HOME/ts1_result.out 
	sort $HOME/ts1_result.out >> $HOME/sorted_ts1_result.out
	local result=$(comm -3 $HOME/sorted_requirements.txt $HOME/sorted_ts1_result.out)
	if [[ -n $result ]]; then
		__kobman_echo_no_colour "Could not find all the requirements"
		return 1
	fi
	[[ -f $HOME/files_to_compare.txt ]] && rm $HOME/files_to_compare.txt
	[[ -f $HOME/ts1_result.out ]] && rm $HOME/ts1_result.out
	[[ -f $HOME/sorted_requirements.txt ]] && rm $HOME/sorted_requirements.txt
	[[ -f $HOME/sorted_ts1_result.out ]] && rm $HOME/sorted_ts1_result.out
}

# function __kobman_update_aries-dev
# {
# 	TODO: Add code for updation
# }

# function __kobman_upgrade_aries-dev
# {
# 	TODO: Add code for upgrade
# }

# function __kobman_start_aries-dev
# {
# 	TODO: Add code for starting the environment
# }

# function __kobman_stop_aries-dev
# {
# 	TODO: Add code for stop
# }


