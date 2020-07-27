#!/bin/bash

function __kob_list {

cat $KOBMAN_DIR/var/list.txt > tmp.txt
__kobman_echo_no_colour "Available environments and their respective version numbers"
__kobman_echo_no_colour "---------------------------------------------------------------"
sed 's/,/ /g' tmp.txt > tmp1.txt
sed 's/,/ /g' tmp.txt | cut -d " " -f 1 > tmp2.txt
cat tmp1.txt | grep -h -f tmp2.txt > tmp3.txt
cat tmp3.txt
rm tmp*.txt
}