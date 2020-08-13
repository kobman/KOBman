#!/bin/bash

function __kob_list {

# cat $KOBMAN_DIR/var/list.txt > tmp.txt
__kobman_echo_no_colour "Available environments and their respective version numbers"
__kobman_echo_no_colour "---------------------------------------------------------------"
sed 's/,/ - /1' $KOBMAN_DIR/var/list.txt
__kobman_echo_no_colour ""
# rm tmp*.txt
}