#!/usr/bin/env bash



function kob {

	local command=$1
	local qualifier1=$2 		# --environment
	local qualifier2=$3 		# environment value
	local qualifier3=$4 		# --version
	local qualifier4=$5 		# version value

	case "$command" in
		-L)
			command="list";;
		-H)
			command="help";;
		-V | --version)
			command="version";;
		-I)
			command="install";;
		-U)
			command="uninstall";;
		-S)
			command="status";;
		-U | self-update)
			command="upgrade";;
		-u)
			command="update";;
		rm | remove)
			command="remove";;
	esac

	if [ -f "${KOBMAN_DIR}/etc/config" ]; then
		source "${KOBMAN_DIR}/etc/config"
	fi

	# no command provided
	if [[ -z "$command" ]]; then
		__kob_help
		return 1
	fi

	# Check if it is a valid command
	local cmd_found=""
	local cmd_target="${KOBMAN_DIR}/src/kobman-${command}.sh"
	if [[ -f "$cmd_target" ]]; then
		cmd_found="$cmd_target"
	fi

	# Check if it is a sourced function
	cmd_target="${KOBMAN_DIR}/envs/kobman-${command}.sh"
	if [[ -f "$cmd_target" ]]; then
		cmd_found="$cmd_target"
	fi
	# couldn't find the command
	if [[ -z "$cmd_found" ]]; then
		echo "Invalid command: $command"
		__kob_help
	fi



	# Check whether the command exists as an internal function...
	#
	# NOTE Internal commands use underscores rather than hyphens,
	# hence the name conversion as the first step here.
	local converted_cmd_name=$(echo "$command" | tr '-' '_')

	# Store the return code of the requested command
	# local final_rc=0

	# Execute the requested command
	if [[ -n "$cmd_found" ]]; then
		# It's available as a shell function
		if [[ "$converted_cmd_name" == "install" ]]; then
			if [[ -z "${qualifier3}" && -n $KOBMAN_VERSION ]]; then
				qualifier4=$KOBMAN_VERSION
			fi
			__kobman_identify_parameter "${qualifier1}" "${qualifier2}" "${qualifier3}" "${qualifier4}" $converted_cmd_name || return 1
			__kob_"$converted_cmd_name" "${qualifier2}" "${qualifier4}"
		elif [[ "$converted_cmd_name" == "uninstall" ]]; then
			if [[ -z "${qualifier3}" && -f $KOBMAN_DIR/envs/kobman-$qualifier2/current ]]; then
				qualifier4=($(cat $KOBMAN_DIR/envs/kobman-$qualifier2/current))
			fi
			__kobman_identify_parameter "${qualifier1}" "${qualifier2}" "${qualifier3}" "${qualifier4}" $converted_cmd_name || return 1
			__kob_"$converted_cmd_name" "${qualifier2}" "${qualifier4}"
		elif [[ "$converted_cmd_name" == "status" || "$converted_cmd_name" == "list" || "$converted_cmd_name" == "help" || "$converted_cmd_name" == "remove" ]]; then
			__kob_"$converted_cmd_name"
			# final_rc=$?
		elif [[ $converted_cmd_name == "version" && -z $qualifier1 ]]; then #kob -v
			__kob_"$converted_cmd_name"
		elif [[ $converted_cmd_name == "version" && -n $qualifier1 ]]; then #kob -V -env <env_name>
			__kobman_validate_environment "${qualifier2}" || return 1
			__kob_"$converted_cmd_name" "${qualifier1}" "${qualifier2}"
		else
			__kobman_echo_red "Could not process your request. Make sure you have given the correct parameters"
			return 1
		fi

	else
		__kobman_echo_red "Could not find command $command"
		return 1
	fi
	unset qualifier1 qualifier2 qualifier3 qualifier4
}

function __kobman_identify_parameter

{
	local qualifier1 qualifier2 qualifier3 qualifier4 command
	qualifier1=$1
	qualifier2=$2
	qualifier3=$3
	qualifier4=$4
	command=$5

	if [ -z "${qualifier1}" ]; then

		__kobman_echo_red "Invalid command : Try with --environment/-env "
		return 1
	fi

	if [[ $qualifier2 == "all" && $command == "uninstall" ]]; then
		return 0

	fi

	if [[ "${qualifier1}" == "--environment" || "${qualifier1}" == "-env" ]]; then

		__kobman_validate_environment "${qualifier2}" || return 1

	fi

	if [[ -z "${qualifier3}" || "${qualifier3}" == "--version" || "${qualifier3}" == "-V" ]]; then

		__kobman_validate_version_format "${qualifier4}" || return 1
		__kobman_check_if_version_exists "${qualifier2}" "${qualifier4}" || return 1

	fi

	unset qualifier1 qualifier2 qualifier3 qualifier4 command
}
