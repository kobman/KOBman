#!/bin/bash

function __kob_update {

	local command deployment_type environment_type parameter_type name_space 

	command=$COMMAND
	deployment_type=$DEPLOYMENT_TYPE
	environment_type=$ENVIRONMENT_TYPE
	parameter_type=$PARAMETER_TYPE
	name_space=$NAME_SPACE 
	
	if [ "$command" = "update" ]
	then
        	case $deployment_type in
                --environment | -env)
                        if [ "$environment_type" = "all" ]
                        then
                                echo "updating all environments"
                        elif [ "$environment_type" = "kobvon" ]
                        then
                                echo "updating kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "updating kob.."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "updating kobdflow.."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "updating kobconnect.."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "updating kobregistory"
			elif [ -d "${KOBMAN_VON_DEV_DIR}/von-network" ]
			then
				if [ "$parameter_type" = "--namespace" ]
                        	then
					echo "updating tobvon environment from $name_space"	
				else
					echo "Try with parameter '--namespace'"		
				fi
				
			elif [ -d "${KOBMAN_TOB_DEV_DIR}/TheOrgBook" ]
			then
				if [ "$parameter_type" = "--namespace" ]
                        	then
					echo "updating tob environment from $name_space"	
				else
					echo "Try with parameter '--namespace'"		
				fi
			
			elif [ -d "${KOBMAN_GREENLIGHT_DEV_DIR}/greenlight" ]
			then
				if [ "$parameter_type" = "--namespace" ]
                        	then
					echo "updating greenlight environment from $name_space"	
				else
					echo "Try with parameter '--namespace'"		
				fi
		
			elif [ -d "${KOBMAN_KOBMAN_DEV_DIR}/KOBman" ]
			then
				if [ "$parameter_type" = "--namespace" ]
                        	then
					echo "updating kobman environment"	
				else
					echo "Try with parameter '--namespace'"		
				fi
			else
                                echo "verifiy your command and try again"
                        fi
                ;;

                *)
                        if [ -z $deployment_type ]
                        then
                                echo "Default Projects are tobvon,tob,greenlight"
                        fi
                ;;

       		 esac

	fi



}
