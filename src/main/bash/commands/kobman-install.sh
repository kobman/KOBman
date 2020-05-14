#!/usr/bin/env bash

version_value=""

function __kob_install {


	if [ -z "${argument_[1]}" ];
	then
		__kobman_echo_no_colour "Invalid command : Try with --environment/-env "
		return	
	elif [ "${argument_[1]}" == "--environment" ] || [ "${argument_[1]}" == "-env"  ];
	then	
		environment_value=${argument_[2]}
		curl -sL "https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list" | grep -i "$environment_value" > /dev/null
	#	curl -L ""${KOBMAN_SERVICE}/${KOBMAN_NAMESPACE}/KOBman/${KOBMAN_DIST_BRANCH}/dist/list | grep -i "${environment_value}" > /dev/null
	if [ "$?" -eq "0" ]   
	then
		if [ "${argument_[3]}" == "--version" ];
		then
       			__kobman_validate_version "${argument_[4]}"
			if [[ "${argument_[5]}" == "--namespace" && $version_value != "" ]];
        		then    
               			namespace_value=${argument_[6]}   
				__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					# kob install --environment kobman --version 0.0.2 --namespace EtricKombat 
			elif [[ "${argument_[5]}" == "" && $version_value != "" ]];
               		then 	
        			namespace_value=${KOBMAN_NAMESPACE}
				__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					# kob install --environment kobman --version 0.0.1	
			else		
				return	
			fi
		elif [ "${argument_[3]}" == "--namespace" ];
		then
        		namespace_value=${argument_[4]}
			version_value=${KOBMAN_VERSION}   
			__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					# kob install --environment kobman --namespace EtricKombat , if the namespace value is not provided we need to do another condition check for that.	
		elif [ "${argument_[3]}" = "" ];
		then
			namespace_value=${KOBMAN_NAMESPACE}
			version_value=${KOBMAN_VERSION}   
			__kobman_create_environment_directory "$environment_value" "$version_value" "$namespace_value" 
					# kob install --environment kobman 	
		fi
	else
       		__kobman_echo_no_colour "environemt not available"
		return	
	fi
	
fi
}

function __kobman_validate_version() 
{
	__kobman_echo_no_colour "$1" | grep -qw '[0-9]*\.[0-9]*\.[0-9]*'
	if [ "$?" -eq "0" ];
	then
        	git ls-remote --tags "https://github.com/asa1997/KOBman" | grep -w 'refs/tags/[0-9]*\.[0-9]*\.[0-9]*' | sort -r | head | grep -o '[^\/]*$' | grep -w "$version" > ~/version.txt
        	if [ "$?" -eq "0" ];    # check version.txt is empty or not (or version variable is empty or not)
        	then
                	version_value=$1	
        	else
                	__kobman_echo_no_colour "version not available"
			return  
		fi
	else
        __kobman_echo_no_colour "invalid version format"
	return 
fi
	

}


function __kobman_create_environment_directory
{

		environment_name=$1
		version_id=$2 
        	namespace_name=$3
		
		__kobman_echo_no_colour "Directory Structure creation of Env : ${environment_name} , version : ${version_id}, namespace : ${namespace_name}" 
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
# 		source ${KOBMAN_DIR}/envs/kob_env_"${parameter_value1}/${latest_version}/kobman-${parameter_value1}.sh"
       		
		__kobman_echo_no_colour "Installation for ${environment_name} has been completed"		

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
