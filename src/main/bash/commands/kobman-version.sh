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
			__kobman_verson_greenlight
		;;	
		kobvon)
			__kobman_verson_kobvon
		;;	
		kob)
			__kobman_verson_kob
		;;	
		kobdflow)
			__kobman_verson_kobdflow
		;;	
		kobconnect)
			__kobman_verson_kobconnect
		;;	
		kobregistery)
			__kobman_verson_kobregistery
		;;	
	esac
}
