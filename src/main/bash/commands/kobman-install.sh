#!/usr/bin/env bash


#2) __kobman_identify_input_argument()
	# read the arguments, identify each argument and assign it to variable using if else logic or case statement
	# for the environment name variable call _validate_and_set_environment()
	# for the version variable call _Validate_and_set_version()
	# for the namespace variable call _set_namespace()
	# for default case (no namespace, version is passed by user as argument) call _set_default()

#5) __kobman_set_namespace()
	# assigning the argument value to the namespace variable

#6) __kobman_set_default()
	# set the version to the latest version and namespace to the hyperledgerkochi (environment variable value)
	# check if the environment variable has a value, version has a value and namespace has a value then call _create_environment_directory()


#7) __kobman_create_environment_directory()
	# create the dir in the specified location
	# create the current file with the latest verson identify
	# call _confirm_environment_dir_exist

#8) __kobman_confirm_environment_dir_exist()




function __kob_install {

#Latest version check and assignment should happen here (if latest has been released )

if [ -z "${argument_[1]}" ];
        then
                __kobman_echo_no_colour "Invalid command : Try with --environment/-env "
                return  
        elif [ "${argument_[1]}" == "--environment" ] || [ "${argument_[1]}" == "-env"  ];  
        then    
		__kobman_validate_set_environment "${argument_[2]}"
                if [ "$?" -eq "0" ]   
                then
                      	environment_value=${argument_[2]}
			
			case "${argument_[3]}" in
			--version)
                                if [[ "${argument_[5]}" == "--namespace" && $version_value != "" ]]; 
                                then    
                                        __kobman_setting_global_variables "${argument_[6]}" "${argument_[4]}"
					__kobman_validate_and_set_version "${version_value}" "${namespace_value}"
					if [ "$?" -eq "0" ];
					then	
						__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					fi	
                                elif [[ "${argument_[5]}" == "" && $version_value != "" ]]; 
                                then    
                                        __kobman_setting_global_variables "${KOBMAN_NAMESPACE}" "${argument_[4]}"
					__kobman_validate_and_set_version "${version_value}" "${namespace_value}"
					if [ "$?" -eq "0" ];
					then	
						__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					fi	
					
                                else    
                                        return  
                                fi
			;;
			--namespace)
                                __kobman_setting_global_variables "${argument_[4]}" "${KOBMAN_VERSION}" 
				__kobman_validate_and_set_version "${version_value}" "${namespace_value}"
				if [ "$?" -eq "0" ];
				then	
					__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
				fi	
			;;


			"")
                                __kobman_setting_global_variables "${KOBMAN_NAMESPACE}" "${KOBMAN_VERSION}" 
				__kobman_validate_and_set_version "${version_value}" "${namespace_value}"
				if [ "$?" -eq "0" ];
				then	
					__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
				fi	
			;;
		
			esac  
                else
                        __kobman_echo_red "Environemt not available ."
                return  
                fi
    
        fi
}

function __kobman_validate_set_environment
{
	curl -sL "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | grep -i "$1" > /dev/null
}


function __kobman_setting_global_variables
{
     	namespace_value=$1
        version_value=$2
}

function __kobman_validate_and_set_version
{
	version=$1
	namespace=$2	
	__kobman_validate_version_format "${version}" 
	if [ "$?" -eq "0" ];
	then
        	__kobman_check_and_confirm_existing_version "${namespace}" "${version}"
        	if [ "$?" -eq "0" ];    # check version.txt is empty or not (or version variable is empty or not)
        	then
                	version_value=$1
			echo "Valid Version"	
        		return 0	
		else
                	__kobman_echo_red "version not available"
			return 1 
		fi
	else
        	__kobman_echo_red "invalid version format"
		return 2  
	fi
	

}

function __kobman_validate_version_format
{
	__kobman_echo_no_colour "$1" | grep -w '[0-9]*\.[0-9]*\.[0-9]*' 
}

function __kobman_check_and_confirm_existing_version
{
       	git ls-remote --tags "https://github.com/${1}/KOBman" | grep -w 'refs/tags/[0-9]*\.[0-9]*\.[0-9]*' | sort -r | head | grep -o '[^\/]*$' | grep -w "$2" 
}


function __kobman_create_environment_directory
{

		environment_name=$1
		version_id=$2 
        	namespace_name=$3
		
		__kobman_echo_red "Directory Structure creation of :"  
               	__kobman_echo_white "Environment 		: ${environment_name} " 
               	__kobman_echo_white "Version 		: ${version_id}" 
               	__kobman_echo_white "Namespace		: ${namespace_name}" 
		
		cd "${KOBMAN_DIR}/envs"
                mkdir -p kob_env_"${environment_name}"
                cd kob_env_"${environment_name}"
                touch current
		destdir="${KOBMAN_DIR}/envs/kob_env_${environment_name}/current"
                if [ -f "$destdir" ]
                then
                	__kobman_echo_no_colour "$version_id" > "$destdir"
                fi
                mkdir -p $version_id
                cd $version_id
      #Needs to be refactored identify the latest version 
                
      		cp "${KOBMAN_DIR}/envs/kobman-${environment_name}.sh" .
                source "${KOBMAN_DIR}/envs/kob_env_${environment_name}/${version_id}/kobman-${environment_name}.sh"
		__kobman_echo_no_colour "${environment_name} installation has been completed -> SUCCESSFULLY"		
		cd ~
}


