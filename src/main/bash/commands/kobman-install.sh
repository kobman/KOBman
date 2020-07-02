#!/usr/bin/env bash


function __kob_install {

	local environment_value=$1
 	local version_value=$2
	__kobman_create_environment_directory "$environment_value" "$version_value"
}

function __kobman_validate_environment
{
	local environment_name=$1
	echo ${environment_name} > $KOBMAN_DIR/var/current
	cat $KOBMAN_DIR/var/list.txt | grep -w "$environment_name" > /dev/null	
	if [ "$?" != "0" ]; then

		__kobman_echo_debug "Environment $environment_name does not exist"
		return 1
	fi
}

function __kobman_validate_version_format
{
	__kobman_echo_no_colour "$1" | grep -qw '[0-9].[0-9].[0-9]' 

	if [ "$?" != "0" ]; then

		__kobman_echo_debug "Version format you have entered is incorrect"
		__kobman_echo_green "Correct format -> 0.0.0 [eg: 0.0.2]"
		return 1
	fi
}

function __kobman_check_if_version_exists
{
	local environment_name=$1
	local version=$2
	cat $KOBMAN_DIR/var/list.txt | grep -w "${environment_name}" | grep -q ${version}
	if [ "$?" != "0" ]; then

		__kobman_echo_debug "version $version for https://github.com/${KOBMAN_NAMESPACE}/${environment_name} does not exist"
		return 1
	fi
}


function __kobman_create_environment_directory
{

		local environment_name=$1
		local version_id=$2
		mkdir -p ${KOBMAN_DIR}/envs/kob_env_"${environment_name}"
		touch ${KOBMAN_DIR}/envs/kob_env_${environment_name}/current
		current="${KOBMAN_DIR}/envs/kob_env_${environment_name}/current"

		if [[ ! -f ${KOBMAN_DIR}/envs/kobman-${environment_name}.sh ]]; then
			__kobman_echo_debug "Could not find file kobman-$environment_name.sh"
			return 1
		fi
		if [[ ! -d ${KOBMAN_DIR}/envs/kob_env_${environment_name}/$version_id ]];
		then
			mkdir -p ${KOBMAN_DIR}/envs/kob_env_${environment_name}/$version_id
			# cd $version_id                                          # Needs to be refactored identify the latest version
			__kobman_echo_no_colour "$version_id" > "$current"
			cp "${KOBMAN_DIR}/envs/kobman-${environment_name}.sh" ${KOBMAN_DIR}/envs/kob_env_${environment_name}/$version_id/
			source "${KOBMAN_DIR}/envs/kob_env_${environment_name}/${version_id}/kobman-${environment_name}.sh"
			__kobman_install_"${environment_name}" "${environment_name}" "${version_id}"
		elif [[ -d ${KOBMAN_DIR}/envs/kob_env_${environment_name}/$version_id && $(cat ${KOBMAN_DIR}/envs/kob_env_${environment_name}/current) != "$version_id" ]];
		then
			__kobman_echo_no_colour "Re-installing  https://github.com/${KOBMAN_NAMESPACE}/${environment_name} with version:${version_id} "
			__kobman_echo_no_colour "$version_id" > "$current"
			__kobman_install_"${environment_name}" "${environment_name}" "${version_id}"
		else
			__kobman_echo_white "Version ${version_id} of https://github.com/${KOBMAN_NAMESPACE}/${environment_name} is currently installed in your system "
			
		fi
}
