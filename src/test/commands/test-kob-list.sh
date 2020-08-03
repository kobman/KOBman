#!/bin/bash

function __test_kob_init
{
	if [[ ! -d $KOBMAN_DIR ]]; then
        echo "kob not found"
        echo "Please install KOBman and try again"
        echo "Exiting!"
        exit 1
    else
    	source $KOBMAN_DIR/bin/kobman-init.sh
    	source $KOBMAN_DIR/src/kobman-utils.sh
        
    fi
    create_list_template_script > $HOME/list_template.txt
    
}

function __test_kob_execute
{
    kob list > $HOME/list_output.txt
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating list command..."
    diff $HOME/list_template.txt $HOME/list_output.txt
    if [[ ! "$?" == 0 ]]; then
    		__kobman_echo_no_colour "list command did not give the desired output"
       		test_status="failed"
        	return 1
   	fi
}

function __test_kob_cleanup
{
    rm $HOME/list_output.txt $HOME/list_template.txt
}

function create_list_template_script(){

cat << EOF
Available environments and their respective version numbers
---------------------------------------------------------------
von-network 0.0.2 0.0.3 0.0.5 0.0.7
TheOrgBook 0.0.2 0.0.3 0.0.5 0.0.7
greenlight 0.0.2 0.0.3 0.0.5 0.0.7
KOBman 0.0.2 0.0.3 0.0.5 0.0.7
KOBConnect 0.0.2 0.0.3 0.0.5 0.0.7
KOBRegistry 0.0.2 0.0.3 0.0.5 0.0.7
KochiOrgBook 0.0.2 0.0.3 0.0.5 0.0.7
KOBDflow 0.0.2 0.0.3 0.0.5 0.0.7
KOBVON 0.0.2 0.0.3 0.0.5 0.0.7
EOF
}

function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-list success"
    else
        __kobman_echo_red "test-kob-list failed"
    fi
}
__test_kob_run

