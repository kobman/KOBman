#!/usr/bin/env bash

function __kobman_tobvon_uninstall
{
	
local command deployment_type environment_type name_space
     	command=$COMMAND
       	deployment_type=$DEPLOYMENT_TYPE
       	environment_type=$ENVIRONMENT_TYPE
       	name_space=$NAME_SPACE
  
  
if [ "$command" = "uninstall" ]
then
        if [ "$DEPLOYMENT_TYPE" = "tobvon" ]
        then
                echo "uninstalling tobvon"
                __kobman_tobvon_uninstall
        elif [ "$DEPLOYMENT_TYPE" = "tob" ]
        then
                echo "uninstalling tob"
                __kobman_tob_uninstall
        elif [ "$DEPLOYMENT_TYPE" = "greenlight" ]
        then
                echo "uninstalling greenlight"
                __kobman_greenlight_uninstall
        else
                echo "check uninstall environment"
	fi

else
        figlet "verifiy your "
        figlet " uninstall command "
        figlet "and try again"
fi




#	__kobman_check_candidate_present "$candidate" || return 1
#	__kobman_check_version_present "$version" || return 1
#
#	current=$(readlink "${KOBMAN_CANDIDATES_DIR}/${candidate}/current" | sed "s_${KOBMAN_CANDIDATES_DIR}/${candidate}/__g")
#	if [[ -h "${KOBMAN_CANDIDATES_DIR}/${candidate}/current" && "$version" == "$current" ]]; then
#		echo ""
#		__kobman_echo_green "Unselecting ${candidate} ${version}..."
#		unlink "${KOBMAN_CANDIDATES_DIR}/${candidate}/current"
#	fi
#	echo ""
#	if [ -d "${KOBMAN_CANDIDATES_DIR}/${candidate}/${version}" ]; then
#		__kobman_echo_green "Uninstalling ${candidate} ${version}..."
#		rm -rf "${KOBMAN_CANDIDATES_DIR}/${candidate}/${version}"
#	else
#		__kobman_echo_red "${candidate} ${version} is not installed."
#	fi

}


function __kobman_unset_proxy_environment {

	echo "unset proxy environment"
}

function __kobman_unset_ubuntu_proxy {

	echo "unset ubuntu proxy"
}

function __kobman_uninstall_basic {

	echo "uninstall basic"
}
