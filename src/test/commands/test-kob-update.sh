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
    if [[ ! -f $KOBMAN_DIR/var/list.txt ]]; then
		__kobman_echo_white "Update failed"
		__kobman_echo_white "Could not find list file in your system."
		__kobman_echo_white "Please reinstall KOBman and try again"
		return 1
	fi
}

function __test_kob_execute
{
    cp $KOBMAN_DIR/var/list.txt $HOME/ts1_result.out
    kob update >> $HOME/remote_list2.txt
    cp $KOBMAN_DIR/var/list.txt $HOME/ts2_result.out
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating update command"
    __kobman_echo_no_colour "Before updation:"
    cat $HOME/ts1_result.out
    __kobman_echo_no_colour "After updation:"
    cat $HOME/ts2_result.out
    sort -u $HOME/ts1_result.out >> $HOME/sorted_result1.out
	sort -u $HOME/ts2_result.out >> $HOME/sorted_result2.out
	local diff=$(comm -3 $HOME/sorted_result1.out $HOME/sorted_result2.out)
	if [[ -z $diff ]]; then
    	__kobman_echo_no_colour "Update failed as there are no new updates."
   		test_status="failed"
	fi
}
function __test_kob_cleanup
{
    rm $HOME/ts*_result.out $HOME/remote_list*.txt $HOME/sorted_result*.out
}

function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_white "test-kob-update success"
    else
        __kobman_echo_white "test-kob-update failed"
    fi
}
__test_kob_run