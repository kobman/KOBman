#!/usr/bin/env bash


function __kob_install {

	local command deployment_type environment_type name_space 

	command=$COMMAND
	deployment_type=$DEPLOYMENT_TYPE
	environment_type=$ENVIRONMENT_TYPE
	name_space=$NAME_SPACE 
	
	if [ "$command" = "install" ]
	then
        	case $deployment_type in
                --dev)
                        if [ "$environment_type" = "all" ]
                        then
                                echo "working all parameter"
                        elif [ "$environment_type" = "kobvon" ]
                        then
                                echo "Building kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "Building kob..."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "Building kobdflow..."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "Building kobconnect..."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "Building kobregistory..."
                        elif [ "$environment_type" = "tobvon" ]
                        then
                                echo "Building tobvon..."
                                __kobman_check_proxy
                                __kobman_ubuntu_update_upgrade
                                __kobman_git_install
                                __kobman_python_install
                                __kobman_docker_install
                                __kobman_npm_install
                                __kobman_visual_studio_install
 				__kobman_install_tobvon "$name_space"
			elif [ "$environment_type" = "tob" ]
                        then
                                echo "Building tob..."
                                if [ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]
				then
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
 				__kobman_install_tob "$name_space"
                        elif [ "$environment_type" = "greenlight" ]
                        then
                                echo "Building greenlight ..."
                                if [ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]
				then
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
 				__kobman_install_greenlight "$name_space"
                        else
                                echo "verifiy your command and try again"
                        fi
                ;;
                --deploy)
                        if [ "$environment_type" = "kobvon" ]
                        then
                                echo "Starting kobvon..."
                        elif [ "$environment_type" = "kob" ]
                        then
                                echo "starting kob..."
                        elif [ "$environment_type" = "kobdflow" ]
                        then
                                echo "Starting kobdflow..."
                        elif [ "$environment_type" = "kobconnect" ]
                        then
                                echo "Starting kobconnect..."
                        elif [ "$environment_type" = "kobregistory" ]
                        then
                                echo "Starting kobregistory..."
 			elif [ "$environment_type" = "tobvon" ]
                        then
                                echo "Starting tobvon..."
                                if [ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]
				then
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
                        	__kobman_install_tobvon "$name_space"
                                __kobman_start_tobvon
			elif [ "$environment_type" = "tob" ]
                        then
                               echo "Starting tob..."
                                if [ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]
				then
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
                                __kobman_install_tob "$name_space"
                                __kobman_start_tob
                         elif [ "$environment_type" = "greenlight" ]
                         then
                                 echo "Building greenlight ..."
                                if [ ! -d "${KOBMAN_CANDIDATES_DIR}/von-network" ]
				then
                                         __kobman_check_proxy
                                         __kobman_ubuntu_update_upgrade
                                         __kobman_git_install
                                         __kobman_python_install
                                         __kobman_docker_install
                                         __kobman_npm_install
                                         __kobman_visual_studio_install
                                fi
                                 __kobman_install_greenlight "$name_space"
                                 __kobman_start_greenlight
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


# 	__kobman_check_candidate_present "$candidate" || return 1
# 	__kobman_determine_version "$candidate" "$version" "$folder" || return 1
# 
# 	if [[ -d "${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" || -h "${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" ]]; then
# 		echo ""
# 		__kobman_echo_red "Stop! ${candidate} ${VERSION} is already installed."
# 		return 1
# 	fi
# 
# 	if [[ ${VERSION_VALID} == 'valid' ]]; then
# 		__kobman_determine_current_version "$candidate"
# 		__kobman_install_candidate_version "$candidate" "$VERSION" || return 1
# 
# 		if [[ "$kobman_auto_answer" != 'true' && "$auto_answer_upgrade" != 'true' && -n "$CURRENT" ]]; then
# 			__kobman_echo_confirm "Do you want ${candidate} ${VERSION} to be set as default? (Y/n): "
# 			read USE
# 		fi
# 		if [[ -z "$USE" || "$USE" == "y" || "$USE" == "Y" ]]; then
# 			echo ""
# 			__kobman_echo_green "Setting ${candidate} ${VERSION} as default."
# 			__kobman_link_candidate_version "$candidate" "$VERSION"
# 			__kobman_add_to_path "$candidate"
# 		fi
# 		return 0
# 
# 	elif [[ "$VERSION_VALID" == 'invalid' && -n "$folder" ]]; then
# 		__kobman_install_local_version "$candidate" "$VERSION" "$folder" || return 1
# 
# 	else
# 		echo ""
# 		__kobman_echo_red "Stop! $1 is not a valid ${candidate} version."
# 		return 1
# 	fi
}

function __kobman_install_candidate_version {
	local candidate version

	candidate="$1"
	version="$2"

	__kobman_download "$candidate" "$version" || return 1
	__kobman_echo_green "Installing: ${candidate} ${version}"

	mkdir -p "${KOBMAN_CANDIDATES_DIR}/${candidate}"

	rm -rf "${KOBMAN_DIR}/tmp/out"
	unzip -oq "${KOBMAN_DIR}/archives/${candidate}-${version}.zip" -d "${KOBMAN_DIR}/tmp/out"
	mv "$KOBMAN_DIR"/tmp/out/* "${KOBMAN_CANDIDATES_DIR}/${candidate}/${version}"
	__kobman_echo_green "Done installing!"
	echo ""
}

function __kobman_install_local_version {
	local candidate version folder version_length version_length_max

	version_length_max=15

	candidate="$1"
	version="$2"
	folder="$3"

	#Validate max length of version
	version_length=${#version}
	__kobman_echo_debug "Validating that actual version length ($version_length) does not exceed max ($version_length_max)"

	if [[ $version_length -gt $version_length_max ]]; then
		__kobman_echo_red "Invalid version! ${version} with length ${version_length} exceeds max of ${version_length_max}!"
		return 1
	fi

	mkdir -p "${KOBMAN_CANDIDATES_DIR}/${candidate}"

	# handle relative paths
	if [[ "$folder" != /* ]]; then
		folder="$(pwd)/$folder"
	fi

	if [[ -d "$folder" ]]; then
		__kobman_echo_green "Linking ${candidate} ${version} to ${folder}"
		ln -s "$folder" "${KOBMAN_CANDIDATES_DIR}/${candidate}/${version}"
		__kobman_echo_green "Done installing!"

	else
		__kobman_echo_red "Invalid path! Refusing to link ${candidate} ${version} to ${folder}."
		return 1
	fi

	echo ""
}

function __kobman_download {
	local candidate version archives_folder

	candidate="$1"
	version="$2"

	archives_folder="${KOBMAN_DIR}/archives"
	if [ ! -f "${archives_folder}/${candidate}-${version}.zip" ]; then

		local platform_parameter="$(echo $KOBMAN_PLATFORM | tr '[:upper:]' '[:lower:]')"
		local download_url="${KOBMAN_CANDIDATES_API}/broker/download/${candidate}/${version}/${platform_parameter}"
		local base_name="${candidate}-${version}"
		local zip_archive_target="${KOBMAN_DIR}/archives/${candidate}-${version}.zip"

		#pre-installation hook: implements function __kobman_pre_installation_hook
		local pre_installation_hook="${KOBMAN_DIR}/tmp/hook_pre_${candidate}_${version}.sh"
		__kobman_echo_debug "Get pre-installation hook: ${KOBMAN_CANDIDATES_API}/hooks/pre/${candidate}/${version}/${platform_parameter}"
		__kobman_secure_curl "${KOBMAN_CANDIDATES_API}/hooks/pre/${candidate}/${version}/${platform_parameter}" > "$pre_installation_hook"
		__kobman_echo_debug "Copy remote pre-installation hook: $pre_installation_hook"
		source "$pre_installation_hook"
		__kobman_pre_installation_hook || return 1
		__kobman_echo_debug "Completed pre-installation hook..."

		export local binary_input="${KOBMAN_DIR}/tmp/${base_name}.bin"
		export local zip_output="${KOBMAN_DIR}/tmp/$base_name.zip"

		echo ""
		__kobman_echo_no_colour "Downloading: ${candidate} ${version}"
		echo ""
		__kobman_echo_no_colour "In progress..."
		echo ""

		#download binary
		__kobman_secure_curl_download "${download_url}" --output "${binary_input}"
		__kobman_echo_debug "Downloaded binary to: ${binary_input}"

		#post-installation hook: implements function __kobman_post_installation_hook
		#responsible for taking `binary_input` and producing `zip_output`
		local post_installation_hook="${KOBMAN_DIR}/tmp/hook_post_${candidate}_${version}.sh"
		__kobman_echo_debug "Get post-installation hook: ${KOBMAN_CANDIDATES_API}/hooks/post/${candidate}/${version}/${platform_parameter}"
		__kobman_secure_curl "${KOBMAN_CANDIDATES_API}/hooks/post/${candidate}/${version}/${platform_parameter}" > "$post_installation_hook"
		__kobman_echo_debug "Copy remote pre-installation hook: $pre_installation_hook"
		source "$post_installation_hook"
		__kobman_post_installation_hook || return 1

		__kobman_echo_debug "Processed binary as: $zip_output"

		__kobman_echo_debug "Completed post-installation hook..."

		mv "$zip_output" "$zip_archive_target"
		__kobman_echo_debug "Moved to archive folder: $zip_archive_target"
	else
		echo ""
		__kobman_echo_no_colour "Found a previously downloaded ${candidate} ${version} archive. Not downloading it again..."
	fi
	__kobman_validate_zip "${archives_folder}/${candidate}-${version}.zip" || return 1
	echo ""
}

function __kobman_validate_zip {
	local zip_archive zip_ok

	zip_archive="$1"
	zip_ok=$(unzip -t "$zip_archive" | grep 'No errors detected in compressed data')
	if [ -z "$zip_ok" ]; then
		rm "$zip_archive"
		echo ""
		__kobman_echo_red "Stop! The archive was corrupt and has been removed! Please try installing again."
		return 1
	fi

}



function __kobman_vim_fix {

	sudo figlet Configuring -f small
	sudo figlet VIM -f small
	sudo cd
        sudo echo "set nocompatible" > /root/.vimrc

}

function __kobman_ubuntu_update_upgrade {

	sudo figlet Ubuntu -f small
	sudo figlet Updation -f small
	sudo figlet Upgrading -f small
	sudo apt-get update -y
        sudo apt-get dist-upgrade -y
	sudo apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev -y
}

function __kobman_proxy_environment {

	sudo figlet Unsetting -f small
	sudo figlet proxy -f small
	unset http_proxy
        unset ftp_proxy
        unset https_proxy
        unset socks_proxy
        unset SOCKS_PROXY
        unset FTP_PROXY
        unset HTTPS_PROXY
        unset HTTP_PROXY
        export HTTPS_PROXY=http://${uname}:${pword}@${prox}:${port}/
        export HTTP_PROXY=http://${uname}:${pword}@${prox}:${port}/
        export FTP_PROXY=ftp://${uname}:${pword}@${prox}:${port}/
        export SOCKS_PROXY=socks://${uname}:${pword}@${prox}:${port}/

        export http_proxy=http://${uname}:${pword}@${prox}:${port}/
        export https_proxy=http://${uname}:${pword}@${prox}:${port}/
        export ftp_proxy=ftp://${uname}:${pword}@${prox}:${port}/
        export socks_proxy=socks://${uname}:${pword}@${prox}:${port}/
        env | grep -i proxy


}

function __kobman_check_proxy {

	read -p "Are you behind a corporate proxy?" reply 
        if [ "$reply" = "y" ] || [ "$reply" = "Y" ] || [ "$reply" = "yes" ] || [ "$reply" = "YES" ] 
	then
		proxychk=1
		sudo dpkg --configure -a
        	read -p "Enter the proxy?[eg: Kochin.dummy.com..etc] :" prox
        	sudo echo -e "\n"
         	read -p "Enter the port?[eg :8080,443..etc]          :" port
         	sudo echo -e "\n"
         	read -p "Enter AD ID? [eg :ai318974]                 :" uname
         	sudo echo -e "\n"
         	read  -p "Enter password?[your login password]        : " pword
         	sudo echo -e "\n"
         	read -p "Enter email ID?                             :" emil
         	sudo echo -e "\n"
         	__kobman_proxy_environment
        for proto in http https ftp socks;
        do
                if [ "$proto" = "https" ];
                then
                  sudo printf 'Acquire::%s::proxy "http://%s:%s@%s:%u/";\n' "$proto" "$uname" "$pword" "$prox" "$port"
                else
                        sudo printf 'Acquire::%s::proxy "%s://%s:%s@%s:%u/";\n' "$proto" "$proto" "$uname" "$pword" "$prox" "$port"
                fi

        done | sudo tee -a /etc/apt/apt.conf > /dev/null
        sudo mkdir -p /etc/systemd/system/docker.service.d/
        sudo touch /etc/systemd/system/docker.service.d/https-proxy.conf
        sudo chmod 777 /etc/systemd/system/docker.service.d/https-proxy.conf
        sudo echo -e "[Service]\nEnvironment="HTTPS_PROXY=http://${uname}:${pword}@${prox}:${port}"">>/etc/systemd/system/docker.service.d/https-proxy.conf

        sudo echo "**********************"
        sudo git config --global user.name "${uname}"
        sudo git config --global user.email "${emil}"
	sudo apt install ca-certificates -y
        sudo git config --global http.sslVerify false
        sudo git config --global http.proxy http://${uname}:${pword}@${prox}:${port}

else 
       sudo echo "Skipping the proxy settings"
fi

}




function __kobman_git_install {

sudo figlet Git -f small
sudo figlet Installing -f small
sudo apt install git -y

}

function __kobman_python_install {
	sudo figlet Python -f small
	sudo figlet Installing -f small
	sudo apt install software-properties-common -y
        sudo apt install Python3.7 -y
        sudo apt install python-pip -y
	pip install --upgrade pip
}

function __kobman_docker_install {

        sudo apt-get remove docker docker-engine docker-ce docker-ce-cli docker.io -y
	
	sudo figlet Docker  -f small
	sudo figlet Installing -f small
	sudo apt-get update -y
        sudo apt install docker.io -y
	sudo figlet Package permission : -f small
	sudo figlet  allowing apt to use -f small
	sudo figlet repository over HTTPS -f small


        sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

       	sudo figlet Docker -f small
	sudo figlet official -f small
	sudo figlet GPG key -f small

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

        sudo figlet Verifitying -f small 
        sudo figlet apt key/fingerprint -f small 
	sudo apt-key fingerprint 0EBFCD88


        sudo figlet Setting up -f small  
	sudo figlet lsb_release -cs -f small
        sudo figlet Docker-stable -f small  
        sudo figlet Repository -f small 
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"

	sudo figlet Docker-Engine -f small
	sudo figlet Installing -f small
	sudo apt-get update -y
        sudo apt-get install docker-ce docker-ce-cli containerd.io -y
        sudo docker run hello-world

	sudo figlet Docker-Compose -f small
	sudo figlet Installing -f small
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

        sudo chmod +x /usr/local/bin/docker-compose
        sudo echo -e "\n\r**********************************";
        sudo echo "*     Docker & Docker compose Version     *";
        sudo echo "**********************************";
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo docker --version
        sudo docker-compose --version
	sudo figlet Docker  -f small
	sudo figlet Login -f small
	sudo rm -rf /root/.docker/
        sudo docker login

        if [[ "$proxychk" -eq 1 ]]
        then
                sudo sed -i '$ d' /root/.docker/config.json
                sudo echo -e ",\n "\""proxies"\"": {\n\t "\""default"\"": {\n\t\t "\""httpProxy"\"": "\""http://${uname}:${pword}@${prox}:${port}"\"",\n\t\t "\""httpsProxy"\"": "\""https://${uname}:${pword}@${prox}:${port}"\"",\n\t\t "\""noProxy"\"": "\""localhost,127.0.0.0/8,*.local,host.docker.internal"\"" \n\t\t}\n\t}\n}">>/root/.docker/config.json

	fi
}

function __kobman_npm_install {

	sudo figlet Purging existing -f small
	sudo figlet NPM components -f small
	npm config rm proxy
        npm config rm proxy --global

        npm config rm https-proxy
        npm config rm https-proxy --global

        npm config rm registry
        npm cache clean

        sudo sudo apt-get remove nodejs nodejs-dev node-gyp libssl1.0-dev npm -y
 
	sudo figlet 'NPM ' -f small
	sudo figlet Installing.. -f small
        sudo sudo apt-get install nodejs nodejs-dev node-gyp libssl1.0-dev npm -y

        npm config set https-proxy http://${uname}:${pword}@${prox}:${port}--global
        npm config set https-proxy http://${uname}:${pword}@${prox}:${port}

        npm config set proxy http://${uname}:${pword}@${prox}:${port}--global
        npm config set proxy http://${uname}:${pword}@${prox}:${port}

        npm config set registry http://registry.npmjs.org
        npm config set strict-ssl false


}


function __kobman_visual_studio_install {

	
	sudo figlet Visual-Studio -f small
	sudo figlet Installing.. -f small
	sudo apt update
	sudo apt install software-properties-common apt-transport-https wget
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt update
	sudo apt install code

}
