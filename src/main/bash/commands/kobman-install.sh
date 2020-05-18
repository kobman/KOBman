#!/usr/bin/env bash


#1) __kobman_setting_global_variables()
	# set the variables to be used in this script for processing

#2) __kobman_identify_input_argument()
	# read the arguments, identify each argument and assign it to variable using if else logic or case statement
	# for the environment name variable call _validate_and_set_environment()
	# for the version variable call _Validate_and_set_version()
	# for the namespace variable call _set_namespace()
	# for default case (no namespace, version is passed by user as argument) call _set_default()

#3) __kobman_validate_set_environment()
	# check if the environment passed as argument is valid by checking it against the list.sh file
	# assign environment variable with argument value
	# if invalid or non-existent environment then return after displaying the respective message

#4) __kobman_validate_and_set_version()
	#4a) __kobman_validate_version_format()
		 # check format of the version, if valid then call check_and_confirm_existing_version() else return
	#4b) __kobman_check_and_confirm_existing_version()
		# check if the version argument exists in the list.sh file then assign version variable with argument else return

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
                environment_value=${argument_[2]}
                curl -sL "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | grep -i "$environment_value" > /dev/null
                if [ "$?" -eq "0" ]   
                then
                      	case "${argument_[3]}" in
			--version)
				version_value=${argument_[4]}
                                if [[ "${argument_[5]}" == "--namespace" && $version_value != "" ]]; 
                                then    
                                        namespace_value=${argument_[6]}   
					__kobman_validate_version "${version_value}" "$namespace_value"
                                        __kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
                                elif [[ "${argument_[5]}" == "" && $version_value != "" ]]; 
                                then    
                                        namespace_value=${KOBMAN_NAMESPACE}
					__kobman_validate_version "${version_value}"
                                        __kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
                                else    
                                        return  
                                fi
			;;
			--namespace)
				version_value=${KOBMAN_VERSION}   
                                __kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
			;;


			"")
			     	namespace_value=${KOBMAN_NAMESPACE}
                                version_value=${KOBMAN_VERSION}   
                                __kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
			;;
		
			esac  
                else
                        __kobman_echo_red "Environemt not available . Check -> kobman,tob,tobvon,greenlight ...etc"
                return  
                fi
    
        fi
}


function __kobman_setting_global_variables {
	
	# set the variables to be used in this script for processing
	version_value=""

}
function __kobman_validate_version() 
{
	version=$1
	namespace=${2:-$KOBMAN_NAMESPACE}	
	
	__kobman_echo_no_colour "${version}" | grep -w '[0-9]*\.[0-9]*\.[0-9]*' > /dev/null
	if [ "$?" -eq "0" ];
	then
#Future Edit : asa1997 should replaced with KOBMAN_NAMESPACE/ $namespace_value 
        	git ls-remote --tags "https://github.com/${namespace}/KOBman" | grep -w 'refs/tags/[0-9]*\.[0-9]*\.[0-9]*' | sort -r | head | grep -o '[^\/]*$' | grep -w "$version" > ~/version.txt
        	if [ "$?" -eq "0" ];    # check version.txt is empty or not (or version variable is empty or not)
        	then
                	version_value=$1	
        	else
                	__kobman_echo_red "version not available"
			return  
		fi
	else
        	__kobman_echo_red "invalid version format"
		export KOBMAN_VERISON=""	
		return 
	fi
	

}


function __kobman_create_environment_directory
{

		environment_name=$1
		version_id=$2 
        	namespace_name=$3
		
		__kobman_echo_no_colour "Directory Structure creation of :"  
               	__kobman_echo_red "Environment 		: ${environment_name} " 
               	__kobman_echo_cyan "Version 		: ${version_id}" 
               	__kobman_echo_green "Namespace		: ${namespace_name}" 
		
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

#	
# function __kobman_install_dependancies {      #    need to work on this later on 
#
#	__kobman_check_proxy
#        __kobman_ubuntu_update_upgrade
#        __kobman_git_install
#        __kobman_python_install
#        __kobman_docker_install
#        __kobman_npm_install
#        __kobman_visual_studio_install
#
#}
#
#
#
#
#function __kobman_ubuntu_update_upgrade {
#	__kobman_echo_yellow "Upgrading/Updating Ubuntu"
#	sudo apt-get update -y
#        sudo apt-get dist-upgrade -y
#	sudo apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev -y
#}
#
#function __kobman_proxy_environment {
#	__kobman_echo_yellow "Unsetting Proxy"
#	unset http_proxy
#        unset ftp_proxy
#        unset https_proxy
#        unset socks_proxy
#        unset SOCKS_PROXY
#        unset FTP_PROXY
#        unset HTTPS_PROXY
#        unset HTTP_PROXY
#        export HTTPS_PROXY=http://${uname}:${pword}@${prox}:${port}/
#        export HTTP_PROXY=http://${uname}:${pword}@${prox}:${port}/
#        export FTP_PROXY=ftp://${uname}:${pword}@${prox}:${port}/
#        export SOCKS_PROXY=socks://${uname}:${pword}@${prox}:${port}/
#
#        export http_proxy=http://${uname}:${pword}@${prox}:${port}/
#        export https_proxy=http://${uname}:${pword}@${prox}:${port}/
#        export ftp_proxy=ftp://${uname}:${pword}@${prox}:${port}/
#        export socks_proxy=socks://${uname}:${pword}@${prox}:${port}/
#        env | grep -i proxy
#
#
#}
#
#function __kobman_check_proxy {
#
#	__kobman_echo_red "================================="
#	read -p "Behind Proxy ?! [y/n]" reply 
#	__kobman_echo_red "================================="
#        if [ "$reply" = "y" ] || [ "$reply" = "Y" ] || [ "$reply" = "yes" ] || [ "$reply" = "YES" ] 
#	then
#		proxychk=1
#		sudo dpkg --configure -a
#		__kobman_echo_red "By passing proxy server requires listed values\n"
#		read -p "Enter the proxy?[eg: Kochin.dummy.com..etc] : " prox
#        	sudo echo -e "\n"
#         	read -p "Enter the port?[eg :8980,443..etc]          : " port
#         	sudo echo -e "\n"
#         	read -p "Enter proxy user name                       : " uname
#         	sudo echo -e "\n"
#         	read  -p "Enter proxy password?[your login password] : " pword
#         	__kobman_echo_red "Configure github username/email"
#         	read -p "Enter github user name                      : " git_uname
#         	sudo echo -e "\n"
#         	read -p "Enter github email ID?                      : " emil
#         	sudo echo -e "\n"
#         	__kobman_proxy_environment
#        for proto in http https ftp socks;
#        do
#                if [ "$proto" = "https" ];
#                then
#                  	sudo printf 'Acquire::%s::proxy "http://%s:%s@%s:%u/";\n' "$proto" "$uname" "$pword" "$prox" "$port"
#                else
#                        sudo printf 'Acquire::%s::proxy "%s://%s:%s@%s:%u/";\n' "$proto" "$proto" "$uname" "$pword" "$prox" "$port"
#                fi
#
#        done | sudo tee -a /etc/apt/apt.conf > /dev/null
#        sudo mkdir -p /etc/systemd/system/docker.service.d/
#        sudo touch /etc/systemd/system/docker.service.d/https-proxy.conf
#        sudo chmod 777 /etc/systemd/system/docker.service.d/https-proxy.conf
#        sudo echo -e "[Service]\nEnvironment="HTTPS_PROXY=http://${uname}:${pword}@${prox}:${port}"">>/etc/systemd/system/docker.service.d/https-proxy.conf
#
#        sudo echo "**********************"
#        sudo git config --global user.name "${git_uname}"
#        sudo git config --global user.email "${emil}"
#	sudo apt install ca-certificates -y
#        sudo git config --global http.sslVerify false
#        sudo git config --global http.proxy http://${uname}:${pword}@${prox}:${port}
#
#else 
#       sudo echo "Skipping the proxy settings"
#fi
#
#}
#
#
#
#
#function __kobman_git_install {
#
#__kobman_echo_yellow "Installing Git"
#sudo apt install git -y
#
#}
#
#function __kobman_python_install {
#	
#	__kobman_echo_yellow "Installing Python"
#	sudo apt install software-properties-common -y
#        sudo apt install Python3.7 -y
#        sudo apt install python-pip -y
#	pip install --upgrade pip
#	sudo ln -sfn /usr/bin/python3.7 /usr/bin/python
#}
#
#function __kobman_docker_install {
#
#          sudo apt-get remove docker docker-engine docker-ce docker-ce-cli docker.io -y
#	__kobman_echo_yellow "Installing Docker"	
#	sudo apt-get update -y
#        sudo apt install docker.io -y
#	__kobman_echo_yellow "Package permission : Allowing apt to use repository over HTTPS"
#
#        sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
#
#	__kobman_echo_yellow "Adding docker official key"
#	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#	__kobman_echo_yellow "Verifying apt key fingerprint"
#	sudo apt-key fingerprint 0EBFCD88
#
#	__kobman_echo_yellow "Setting up $(lsb_release -is) $(lsb_release -cs) docker-stable repository"
#        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
#	__kobman_echo_yellow "Installing Docker-Engine"
#	sudo apt-get update -y
#        sudo apt-get install docker-ce docker-ce-cli containerd.io -y
#        sudo docker run hello-world
#	__kobman_echo_yellow "Installing Docker-Compose"
#	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#
#        sudo chmod +x /usr/local/bin/docker-compose
#        sudo systemctl start docker
#        sudo systemctl enable docker
#	__kobman_echo_yellow "Docker Version"
#        sudo docker --version
#	__kobman_echo_yellow "Docker-Compose Version"
#        sudo docker-compose --version
#	__kobman_echo_red "Docker Login"
#	sudo rm -rf /root/.docker/
#        >/etc/systemd/system/docker.service.d/https-proxy.conf > /dev/null
#	sudo docker login
#
#        if [[ "$proxychk" -eq 1 ]]
#        then
#		__kobman_echo_red "Docker proxy setting up @ /root/.docker/config.json"
#                sudo sed -i '$ d' /root/.docker/config.json
#                sudo echo -e ",\n "\""proxies"\"": {\n\t "\""default"\"": {\n\t\t "\""httpProxy"\"": "\""http://${uname}:${pword}@${prox}:${port}"\"",\n\t\t "\""httpsProxy"\"": "\""https://${uname}:${pword}@${prox}:${port}"\"",\n\t\t "\""noProxy"\"": "\""localhost,127.0.0.0/8,*.local,host.docker.internal"\"" \n\t\t}\n\t}\n}">>/root/.docker/config.json
#
#	fi
#}
#
#function __kobman_npm_install {
#	
#	__kobman_echo_yellow "Purging existing NPM components"
#	npm config rm proxy
#        npm config rm proxy --global
#
#        npm config rm https-proxy
#        npm config rm https-proxy --global
#
#        npm config rm registry
#        npm cache clean
#
#        sudo sudo apt-get remove nodejs nodejs-dev node-gyp libssl1.0-dev npm -y
# 
#	__kobman_echo_yellow "Installing NPM"
#        sudo sudo apt-get install nodejs nodejs-dev node-gyp libssl1.0-dev npm -y
#
#        npm config set https-proxy http://${uname}:${pword}@${prox}:${port}--global
#        npm config set https-proxy http://${uname}:${pword}@${prox}:${port}
#
#        npm config set proxy http://${uname}:${pword}@${prox}:${port}--global
#        npm config set proxy http://${uname}:${pword}@${prox}:${port}
#
#        npm config set registry http://registry.npmjs.org
#        npm config set strict-ssl false
#
#
#}
#
#
#function __kobman_visual_studio_install {
#
#	__kobman_echo_yellow "Installing Visual-Studio"	
#	sudo apt install software-properties-common apt-transport-https wget
#	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#	sudo apt install code
#
#}
