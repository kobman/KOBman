#!/bin/bash

function __test_kob_init
{
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
    if [[ ! -f $KOBMAN_DIR/var/list.txt ]]; then
        __kobman_echo_no_colour "Could not find list.txt"
        __kobman_echo_no_colour "Try reinstalling KOBman"
        __kobman_echo_no_colour "Exiting!!!"
        exit 1
    fi
}

function __test_kob_execute
{
    kob help >> output.txt
    echo $? >> result.txt
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating test command..."
    true=0
    
    cat result.txt | grep -q $true
    if [[ ! "$?" == "0" ]]; then
        __kobman_echo_no_colour "test command did not execute properly"
        test_status="failed"
        return 1
    fi
    
    commands="install uninstall status list version help"
    for command in $commands;
    do
    	cat output.txt |grep -iq $command
    	if [[ ! "$?" == "0" ]]; then
    		__kobman_echo_no_colour "test command did not give the desired output"
       		test_status="failed"
        	return 1
    	fi
    done
}

function __test_kob_cleanup
{
    rm output.txt result.txt
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
