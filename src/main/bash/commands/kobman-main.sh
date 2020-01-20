#!/usr/bin/env bash


function kob {

	COMMAND="$1"
	DEPLOYMENT_TYPE="$2"
	ENVIRONMENT_TYPE="$3"
	NAME_SPACE=${4:-hyperledgerkochi}
	case "$COMMAND" in
		l)
			COMMAND="list";;
		ls)
			COMMAND="list";;
		h)
			COMMAND="help";;
		v)
			COMMAND="version";;
		u)
			COMMAND="use";;
		i)
			COMMAND="install";;
		rm)
			COMMAND="uninstall";;
		c)
			COMMAND="current";;
		ug)
			COMMAND="upgrade";;
		d)
			COMMAND="default";;
		b)
			COMMAND="broadcast";;
		s)
			COMMAND="status";;
		p)
			COMMAND="proxy";;
	esac

	#
	# Various sanity checks and default settings
	#

#	# Check version and candidates cache
#	if [[ "$COMMAND" != "update" ]]; then
#		___kobman_check_candidates_cache "$KOBMAN_CANDIDATES_CACHE" || return 1
#		___kobman_check_version_cache
#	fi
#
#	# Always presume internet availability
#	KOBMAN_AVAILABLE="true"
#	if [ -z "$KOBMAN_OFFLINE_MODE" ]; then
#		KOBMAN_OFFLINE_MODE="false"
#	fi
#
#	# ...unless proven otherwise
#	__kobman_update_broadcast_and_service_availability
#
	# Load the kobman config if it exists.
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


#if [ "$COMMAND" = "install" ]
#then
#	case $DEPLOYMENT_TYPE in
#		--dev)
#			if [ "$ENVIRONMENT_TYPE" = "all" ]
#			then
#				echo "working all parameter"
#			elif [ "$ENVIRONMENT_TYPE" = "kobvon" ]
#			then	
#				echo "Building kobvon..."	
#			elif [ "$ENVIRONMENT_TYPE" = "kob" ]
#			then	
#				echo "Building kob..."	
#			elif [ "$ENVIRONMENT_TYPE" = "kobdflow" ]
#			then	
#				echo "Building kobdflow..."	
#			elif [ "$ENVIRONMENT_TYPE" = "kobconnect" ]
#			then	
#				echo "Building kobconnect..."	
#			elif [ "$ENVIRONMENT_TYPE" = "kobregistory" ]
#			then	
#				echo "Building kobregistory..."	
#			elif [ "$ENVIRONMENT_TYPE" = "tobvon" ]
#			then	
#				echo "Building tobvon..."	
#				if [[ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]]; then
#	       				 figlet avoid repetitive steps	
#					 __kobman_check_proxy
#                			 __kobman_ubuntu_update_upgrade
#                			 __kobman_git_install
#               				 __kobman_python_install
#                		         __kobman_docker_install
#                			 __kobman_npm_install
#                		         __kobman_visual_studio_install
#				fi
#				__kobman_tobvon_build "$NAME_SPACE"
#			elif [ "$ENVIRONMENT_TYPE" = "tob" ]
#			then	
#				echo "Building tob..."	
#				__kobman_check_proxy
#				__kobman_ubuntu_update_upgrade
#				__kobman_git_install
#    				__kobman_python_install
# 				__kobman_docker_install
#	     			__kobman_npm_install
#				__kobman_visual_studio_install
#				__kobman_tob_build "$NAME_SPACE"
#			elif [ "$ENVIRONMENT_TYPE" = "greenlight" ]
#			then	
#				echo "Building greenlight ..."	
#				__kobman_check_proxy
#				__kobman_ubuntu_update_upgrade
#				__kobman_git_install
#    				__kobman_python_install
# 				__kobman_docker_install
#	     			__kobman_npm_install
#				__kobman_visual_studio_install
#				__kobman_greenlight_build "$NAME_SPACE"
#			else
#				echo "verifiy your command and try again"
#			fi		
#		;;
#		--deploy)
#                        if [ "$ENVIRONMENT_TYPE" = "kobvon" ]
#                        then
#                                echo "Starting kobvon..."
#			elif [ "$ENVIRONMENT_TYPE" = "kob" ]
#                        then
#                                echo "starting kob..."
#                        elif [ "$ENVIRONMENT_TYPE" = "kobdflow" ]
#                        then
#                                echo "Starting kobdflow..."
#                        elif [ "$ENVIRONMENT_TYPE" = "kobconnect" ]
#                        then
#                                echo "Starting kobconnect..."
#                        elif [ "$ENVIRONMENT_TYPE" = "kobregistory" ]
#                        then
#                                echo "Starting kobregistory..."
#                        elif [ "$ENVIRONMENT_TYPE" = "tobvon" ]
#                        then
#                                echo "Starting tobvon..."
#	                        __kobman_check_proxy
#	                        __kobman_ubuntu_update_upgrade
#		                __kobman_git_install
#	                        __kobman_python_install
#	                        __kobman_docker_install
#	                        __kobman_npm_install
#       		       		__kobman_visual_studio_install        
#				__kobman_tobvon_build "$NAME_SPACE"
#				__kobman_tobvon_start
#                        elif [ "$ENVIRONMENT_TYPE" = "tob" ]
#                      	then
#                               echo "Starting tob..."
#                         	__kobman_tob_build "$NAME_SPACE"
#				__kobman_tob_start
#                         elif [ "$ENVIRONMENT_TYPE" = "greenlight" ]
#                         then
#                                 echo "Building greenlight ..."
#                         	 __kobman_greenlight_build "$NAME_SPACE"
#		  		 __kobman_greenlight_start
#                         else
#                                 echo "verifiy your command and try again"
#                         fi
#                 ;;
#
#		kobvon)
#				echo "starting kobvon..."	
#		;;
#		kob)
#				echo "starting kob..."	
#		;;
#				
#		kobdflow)
#				echo "starting kobdflow..."	
#		;;
#		kobconnect)
#				echo "starting kobconnect..."	
#		;;
#		kobregistory)
#				echo "starting kobregistory..."	
#		;;
#		tobvon)
#				echo "starting tobvon..."	
#				__kobman_check_proxy
#				__kobman_ubuntu_update_upgrade
#				__kobman_git_install
#    				__kobman_python_install
# 				__kobman_docker_install
#	     			__kobman_npm_install
#				__kobman_tobvon_build
#				__kobman_tobvon_start
#		;;
#		tob)
#				echo "starting tob..."	
#				__kobman_tob_build
#				__kobman_tob_start
#		;;
#		greenlight)
#				echo "starting greenlight ..."	
#				__kobman_greenlight_build
#				__kobman_greenlight_start
#		;;
#		*)
#			if [ -z $DEPLOYMENT_TYPE ]
#			then
#				echo "Default Projects are tobvon,tob,greenlight"	
#			fi			
#		;;
#
#	esac
#			
#elif [ "$COMMAND" = "uninstall" ]
#then	
#
#	if [ "$DEPLOYMENT_TYPE" = "tobvon" ]
#	then
#		echo "uninstalling tobvon"	
#		__kobman_tobvon_uninstall
#	elif [ "$DEPLOYMENT_TYPE" = "tob" ]
#	then
#		echo "uninstalling tob"	
#		__kobman_tob_uninstall
#	elif [ "$DEPLOYMENT_TYPE" = "greenlight" ]
#	then
#		echo "uninstalling greenlight"	
#		__kobman_greenlight_uninstall
#	else
#		echo "check uninstall environment"
#	fi
## elif [ "$COMMAND" = "list" ]
## then
## 	__kob_list $COMMAND
## elif [ "$COMMAND" = "status" ]
## then
##	__kob_status	
#else
#	echo "verifiy your command and try again"
#fi		
#

	#	# Check whether the candidate exists
#	local kobman_valid_candidate=$(echo ${KOBMAN_CANDIDATES[@]} | grep -w "$DEPLOYMENT_TYPE")
#	if [[ -n "$DEPLOYMENT_TYPE" && "$COMMAND" != "offline" && "$COMMAND" != "flush" && "$COMMAND" != "selfupdate" && -z "$kobman_valid_candidate" ]]; then
#		echo ""
#		__kobman_echo_red "Stop! $DEPLOYMENT_TYPE is not a valid candidate."
#		return 1
#	fi
#
#	# Validate offline deployment_type
#	if [[ "$COMMAND" == "offline" && -n "$DEPLOYMENT_TYPE" && -z $(echo "enable disable" | grep -w "$DEPLOYMENT_TYPE") ]]; then
#		echo ""
#		__kobman_echo_red "Stop! $DEPLOYMENT_TYPE is not a valid offline mode."
#	fi

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

#	# Attempt upgrade after all is done
#	if [[ "$COMMAND" != "selfupdate" ]]; then
#		__kobman_auto_update "$KOBMAN_REMOTE_VERSION" "$KOBMAN_VERSION"
#	fi
#	return $final_rc

}
