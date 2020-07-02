#!/bin/bash

function __kob_update
{
	if [[ ! -f $KOBMAN_DIR/var/list.txt ]]; then
		__kobman_echo_red "Update failed"
		__kobman_echo_red "Could not find list file in your system."
		__kobman_echo_red "Please reinstall KOBman and try again"
		return 1
	fi
	list_url="https://raw.githubusercontent.com/$KOBMAN_NAMESPACE/KOBman/master/dist/list.txt"
	__kobman_secure_curl "$list_url" >> remote_list.txt
	remote=$(cat remote_list.txt)
	if [[ -z $remote ]]; then
		__kobman_echo_red "Update failed"
		__kobman_echo_red "Remote list corrupeted!!!!"
		rm remote_list.txt
		return 1
	fi
	cp $KOBMAN_DIR/var/list.txt local_list.txt
	sort -u local_list.txt >> sorted_local_list.txt
	sort -u remote_list.txt >> sorted_remote_list.txt
	local diff=$(comm -3 sorted_local_list.txt sorted_remote_list.txt)
	if [[ -z $diff ]]; then
		__kobman_echo_no_colour "No updates this time"
		__kobman_echo_no_colour "Please try again later"
	else
		__kobman_echo_no_colour "List file has been updated"
		rm $KOBMAN_DIR/var/list.txt
		cat remote_list.txt >> $KOBMAN_DIR/var/list.txt
		__kobman_echo_no_colour "Run the following command on the terminal for the updated list"
		__kobman_echo_white "$ kob list"
		
	fi	
	rm local_list.txt remote_list.txt sorted_local_list.txt sorted_remote_list.txt 
	
}
