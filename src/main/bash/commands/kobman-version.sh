#!/usr/bin/env bash


function __kob_version {

 	local command deployment_type environment_type name_space 
	command=$COMMAND
	deployment_type=$DEPLOYMENT_TYPE
	environment_type=$ENVIRONMENT_TYPE
	name_space=$NAME_SPACE                                                                   
	__kobman_environment_version "$DEPLOYMENT_TYPE" 

}



function __kobman_environment_version {

	case "$DEPLOYMENT_TYPE" in
		tobvon)
			__kobman_version_tobvon "$name_space"

		;;	
		tob)
			__kobman_version_tob "$name_space"

		;;	
		greenlight)
			__kobman_version_greenlight "$name_space"
		;;	
		kobman)
			__kobman_version_kobman "$name_space"

		;;	
		kobvon)
			__kobman_version_kobvon "$name_space"

		;;	
		kob)
			__kobman_version_kob "$name_space"

		;;	
		kobdflow)
			__kobman_version_kobdflow "$name_space"

		;;	
		kobconnect)
			__kobman_version_kobconnect "$name_space"

		;;	
		kobregistery)
			__kobman_version_kobregistery "$name_space"

		;;	
	esac
}
