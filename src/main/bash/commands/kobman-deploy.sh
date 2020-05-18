#!/bin/bash
function __kob_deploy {

	local command deployment_type environment_type parameter_type name_space 

	command=$COMMAND
	deployment_type=$DEPLOYMENT_TYPE
	environment_type=$ENVIRONMENT_TYPE
	parameter_type=$PARAMETER_TYPE
	name_space=$NAME_SPACE 
	
	if [ "$command" = "deploy" ]
	then
        	case $deployment_type in
                --environment | -env)
                        if [ "$environment_type" = "all" ]
                        then
                                echo "deploying all environments"
                        elif [ "$environment_type" = "kobvon" ]
                        then
                                echo "deploying kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "deploying kob.."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "deploying kobdflow.."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "deploying kobconnect.."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "deploying kobregistory"
                        elif [ "$environment_type" = "tobvon" ]
                        then
				if [ -d "${KOBMAN_VON_DEV_DIR}/von-network" ]
				then
					__kobman_check_proxy
       		                        __kobman_ubuntu_update_upgrade
               		                __kobman_git_install
                       		        __kobman_python_install
                               		__kobman_docker_install
                                	__kobman_npm_install
     					__kobman_visual_studio_install
				fi
	
				if [ "$parameter_type" = "--namespace" ]
                        	then
 					__kobman_install_tobvon "$name_space"
					__kobman_start_tobvon	
				else
					echo "Try with parameter '--namespace'"		
				fi	
			elif [ "$environment_type" = "tob" ]
                        then
				if [ -d "${KOBMAN_VON_DEV_DIR}/von-network" ]
				then
                                       	echo "deploying tob env" 
					 __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
				if [ "$parameter_type" = "--namespace" ]
                        	then
 					__kobman_install_tob "$name_space"
					__kobman_start_tob	
				else
					echo "Try with parameter '--namespace'"		
				fi	
                        elif [ "$environment_type" = "greenlight" ]
                        then
				if [ -d "${KOBMAN_VON_DEV_DIR}/von-network" ]
				then
                                       	echo "deploying greenlight env" 
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
				if [ "$parameter_type" = "--namespace" ]
                        	then
 					__kobman_install_greenlight "$name_space"
					__kobman_start_greenlight	
				else
					echo "Try with parameter '--namespace'"		
				fi	
                        elif [ "$environment_type" = "kobman" ]
                        then
                               __kobman_install_kobman "$name_space"
				cd ~	
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
