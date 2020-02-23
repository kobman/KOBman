#!/usr/bin/env bash


function kob {

	COMMAND="$1"
	DEPLOYMENT_TYPE="$2"
	ENVIRONMENT_TYPE="$3"
	NAME_SPACE=${4:-EtricKombat}
	case "$COMMAND" in
		l)
			COMMAND="list";;
		ls)
			COMMAND="list";;
		h)
			COMMAND="help";;
		v)
			COMMAND="version";;
		i)
			COMMAND="install";;
		rm)
			COMMAND="uninstall";;
		s)
			COMMAND="status";;
	esac
	
	if [ -f "${KOBMAN_DIR}/etc/config" ]; then
		source "${KOBMAN_DIR}/etc/config"
	fi

	# no command provided
	if [[ -z "$COMMAND" ]]; then
		__kob_help
		return 1
	fi

	# Check if it is a valid command
	CMD_FOUND=""
	CMD_TARGET="${KOBMAN_DIR}/src/kobman-${COMMAND}.sh"
	if [[ -f "$CMD_TARGET" ]]; then
		CMD_FOUND="$CMD_TARGET"
	fi

	# Check if it is a sourced function
	CMD_TARGET="${KOBMAN_DIR}/env/kobman-${COMMAND}.sh"
	if [[ -f "$CMD_TARGET" ]]; then
		CMD_FOUND="$CMD_TARGET"
	fi 
	# couldn't find the command
	if [[ -z "$CMD_FOUND" ]]; then
		echo "Invalid command: $COMMAND"
		__kob_help
	fi



	# Check whether the command exists as an internal function...
	#
	# NOTE Internal commands use underscores rather than hyphens,
	# hence the name conversion as the first step here.
	CONVERTED_CMD_NAME=$(echo "$COMMAND" | tr '-' '_')

	# Store the return code of the requested command
	local final_rc=0

	# Execute the requested command
	if [ -n "$CMD_FOUND" ]; then
		# It's available as a shell function
		__kob_"$CONVERTED_CMD_NAME" "$DEPLOYMENT_TYPE" "$3" "$4"
		final_rc=$?
	fi


}
