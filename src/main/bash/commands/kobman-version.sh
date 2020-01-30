#!/usr/bin/env bash


function __kob_version {

                                                                   
__kobman_environment_version "$DEPLOYMENT_TYPE" 
#	__kobman_echo_yellow ${KOBMAN_VERSION_0.01}

}



function __kobman_environment_version {

	case "$DEPLOYMENT_TYPE" in
		tobvon)
			echo "tobvon -Version ";;	
		tob)
			echo "tob -Version ";;	
		greenlight)
			echo "greenlight -Version ";;	

		kobvon)
			echo "kobvon -Version ";;	

		kob)
			echo "kob -Version ";;	

		kobdflow)
			echo "kobdflow -Version ";;	

		kobconnect)
			echo "kobconnect -Version ";;	

		kobregistery)
			echo "kobregistery -Version ";;	

	esac
}
