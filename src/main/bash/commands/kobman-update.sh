#!/bin/bash

function __kob_update
{
	if [[ ! -f $KOBMAN_DIR/var/list.txt ]]; then
		__kobman_echo_red "Update failed"
		__kobman_echo_red "Could not find list file in your system."
		__kobman_echo_red "Please reinstall KOBman and try again"
		return 1
	fi

	[[ -f $KOBMAN_DIR/etc/user-config.cfg ]] && source "$KOBMAN_DIR/bin/kobman-init.sh"

	check_value_for_repo_env_var || return 1
	
	local env_repos namespace repo_name remote_list_url cached_list diff delta flag=0 
	cached_list=$KOBMAN_DIR/var/list.txt
	sort -u $KOBMAN_DIR/var/list.txt  >> $HOME/sorted_local_list.txt
	env_repos=$(echo $KOBMAN_ENV_REPOS | sed 's/,/ /g')
	
	for i in ${env_repos[@]}; do
    	namespace=$(echo $i | cut -d "/" -f 1)
    	repo_name=$(echo $i | cut -d "/" -f 2)
		
		if [[ $namespace == $KOBMAN_NAMESPACE && $repo_name == "kobman-env-repo" ]]; then
			continue
		fi
    	
		
		if curl -s https://api.github.com/repos/$namespace/$repo_name | grep -q "Not Found"
    	then
      		continue
    	fi

		remote_list_url="https://raw.githubusercontent.com/$namespace/$repo_name/master/list.txt"
		__kobman_secure_curl "$remote_list_url" >> $HOME/remote_list.txt
		remote_list=$(cat $HOME/remote_list.txt)
		if [[ -z $remote_list ]]; then
			__kobman_echo_red "Update failed"
			__kobman_echo_red "Remote list corrupeted!!!!"
			[[ -f $HOME/remote_list.txt ]] && rm $HOME/remote_list.txt
			[[ -f $HOME/sorted_local_list.txt ]] && rm $HOME/sorted_local_list.txt
			unset env_repos namespace repo_name remote_list_url cached_list diff delta  flag
			return 1
		fi
		
		sort -u $HOME/remote_list.txt >> $HOME/sorted_remote_list.txt
		diff=$(comm -13 $HOME/sorted_local_list.txt $HOME/sorted_remote_list.txt)
		if [[ -n $diff ]]; then
			flag=1
			__kobman_echo_no_colour "" >> $cached_list
			# cat $HOME/sorted_remote_list.txt >> $cached_list
			for i in ${diff[@]}; do
				echo $i >> $cached_list
			done
			__kobman_download_envs_from_repo $namespace $repo_name
		else
			[[ -f $HOME/remote_list.txt ]] && rm $HOME/remote_list.txt
			[[ -f $HOME/sorted_remote_list.txt ]] && rm $HOME/sorted_remote_list.txt 
			continue
		fi	
		[[ -f $HOME/remote_list.txt ]] && rm $HOME/remote_list.txt
		[[ -f $HOME/sorted_remote_list.txt ]] && rm $HOME/sorted_remote_list.txt 

	done
	
	[[ -f $HOME/sorted_local_list.txt ]] && rm $HOME/sorted_local_list.txt  
	
	check_for_changes $flag
	unset env_repos namespace repo_name remote_list_url cached_list diff delta flag

	
}
##check this again
function check_value_for_repo_env_var
{
	if [[ -z $KOBMAN_ENV_REPOS ]]; then
		__kobman_echo_no_colour "No user repos found"
		return 1
	fi
}

function check_for_changes
{
	local flag=$1
	if [[ $flag -eq 1 ]]; then
		__kobman_echo_white "Updated successfully."
		__kobman_echo_no_colour ""
		__kobman_echo_white "Please run the below command to see the updated list"
		__kobman_echo_yellow "$ kob list"
	else
		__kobman_echo_no_colour "No updates found"
	fi
}
