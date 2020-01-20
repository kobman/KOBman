#!/usr/bin/env bash

#
#   Copyright 2017 Marco Vermeulen
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

function __kob_uninstall {
	
local command qualifier three name_space
     	command=$COMMAND
       	qualifier=$QUALIFIER
       	three=$THREE
       	name_space=$NAME_SPACE
  
  
if [ "$command" = "uninstall" ]
then
        if [ "$QUALIFIER" = "tobvon" ]
        then
                echo "uninstalling tobvon"
                __kobman_tobvon_uninstall
        elif [ "$QUALIFIER" = "tob" ]
        then
                echo "uninstalling tob"
                __kobman_tob_uninstall
        elif [ "$QUALIFIER" = "greenlight" ]
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
