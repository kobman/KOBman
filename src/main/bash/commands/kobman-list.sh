#!/bin/bash

function __kob_list {

__kobman_echo_no_colour "Available environments and their respective version numbers"
__kobman_echo_no_colour "---------------------------------------------------------------"
sed -i '/^$/d' $KOBMAN_DIR/var/list.txt
sed 's/,/ - /1' $KOBMAN_DIR/var/list.txt 
}