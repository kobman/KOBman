#!/usr/bin/env bash

function __kob_uninstall {
local command deployment_type environment_type name_space 

	command=$COMMAND
	deployment_type=$DEPLOYMENT_TYPE
	environment_type=$ENVIRONMENT_TYPE
	name_space=$NAME_SPACE 
	
	if [ "$command" = "uninstall" ]
	then
        	case $deployment_type in
                --dev)
                        if [ "$environment_type" = "all" ]
                        then
                                echo "uninstalling all environment"
                        elif [ "$environment_type" = "kobvon" ]
                        then
                                echo "uninstalling kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "uninstalling kob..."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "uninstalling kobdflow..."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "uninstalling kobconnect..."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "uninstalling kobregistory..."
                        elif [ "$environment_type" = "tobvon" ]
                        then
                                echo "uninstalling tobvon..."
                                __kobman_uninstall_tobvon
			elif [ "$environment_type" = "tob" ]
                        then
				echo "uninstalling tob..."
                                __kobman_uninstall_tob
                        elif [ "$environment_type" = "greenlight" ]
                        then
				echo "uninstalling greenlight..."
                                __kobman_uninstall_greenlight
                        else
                                echo "verifiy your command and try again"
                        fi
                ;;
                --deploy)
                        if [ "$environment_type" = "kobvon" ]
                        then
                                echo "uninstalling kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "uninstalling kob..."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "uninstalling kobdflow..."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "uninstalling kobconnect..."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "uninstalling kobregistory..."
 			elif [ "$environment_type" = "tobvon" ]
                        then
				echo "uninstalling tobvon..."
                                __kobman_uninstall_tobvon
			elif [ "$environment_type" = "tob" ]
                        then
			       echo "uninstalling tob..."
                               __kobman_uninstall_tob
                         elif [ "$environment_type" = "greenlight" ]
                         then
				echo "uninstalling greenlight..."
                                __kobman_uninstall_greenlight
                         else
                                 echo "verifiy your command and try again"
                         fi
                 ;;

                *)
                        if [ -z $deployment_type ]
                        then
                                echo "Default deployment are --dev,--deploy"
                        fi
                ;;

       		 esac

	fi

}
