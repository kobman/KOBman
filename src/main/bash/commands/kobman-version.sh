#!/usr/bin/env bash


function __kob_version {

                                                                   
__kobman_environment_version "$DEPLOYMENT_TYPE" 
#	__kobman_echo_yellow ${KOBMAN_VERSION_0.01}

}



function __kobman_environment_version {

	case "$DEPLOYMENT_TYPE" in
		tobvon)
			__kobman_version_tobvon
		;;	
		tob)
			__kobman_version_tob
		;;	
		greenlight)
			__kobman_version_greenlight
		;;	
		kobvon)
			__kobman_version_kobvon
		;;	
		kob)
			__kobman_version_kob
		;;	
		kobdflow)
			__kobman_version_kobdflow
		;;	
		kobconnect)
			__kobman_version_kobconnect
		;;	
		kobregistery)
			__kobman_version_kobregistery
		;;	
	esac
}
