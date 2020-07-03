#!/bin/bash

function __test_kob_init
{
	commands="install uninstall status list version help update upgrade"
    if [[ -d $KOBMAN_DIR ]]; then
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
        source $KOBMAN_DIR/bin/kobman-init.sh
    else
        echo "kob not found"
        echo "Please install KOBman and try again"
        echo "Exiting!"
        exit 1
    fi
    
}

function __test_kob_execute
{
    kob help >> output.txt
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating help command..." 
    
    for command in $commands;
    do
    	cat output.txt |grep -iq $command
    	if [[ ! "$?" == "0" ]]; then
    		__kobman_echo_no_colour "help command did not give the desired output since $command was not in the output."
       		test_status="failed"
        	return 1
    	fi
    done
}

function __test_kob_cleanup
{
    rm output.txt 
}

function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-help success"
    else
        __kobman_echo_red "test-kob-help failed"
    fi
}
__test_kob_run
