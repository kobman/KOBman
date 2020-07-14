#!/bin/bash
function __test_kob_init
{
    if [[ ! -d $KOBMAN_DIR ]]; then
        echo "kobman not found"
        echo "Please install kobman first and try again"
        exit 1
    else
        source $KOBMAN_DIR/bin/kobman-init.sh
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
    fi

    if [[ -z $FAKE_REPO_NAMESPACE ]]; then
        __kobman_echo_no_colour "No dummy namespace found"
        __kobman_echo_no_colour "Cannot run test script without fake repository"
        __kobman_echo_no_colour "Exiting!!!"
        exit 1
    fi
}

function __test_kob_execute
{
    __kobman_echo_no_colour "Executing commands"
    kob -V >> $HOME/ts1_result.out
    tree $KOBMAN_DIR/envs >> $HOME/tree1.txt
    kob upgrade >> $HOME/output.txt
    tree $KOBMAN_DIR/envs >> $HOME/tree2.txt
    kob -V >> $HOME/ts2_result.out
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating upgrade command...."
    diff1=$(comm -3 $HOME/ts1_result.out $HOME/ts2_result.out)
    if [[ -z $diff1 ]]; then
        __kobman_echo_no_colour "Version did not change after upgrading"
        test_status="failed"
        return 1
    fi

    diff2=$(comm -3 $HOME/tree1.txt $HOME/tree2.txt)
    if [[ -n $diff2 ]]; then
        __kobman_echo_no_colour "User configs were not restored properly"
        test_status="failed"
        return 1
    fi
}

function __test_kob_cleanup
{
    rm $HOME/output.txt $HOME/*.out $HOME/tree1.txt $HOME/tree2.txt
}
function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-upgrade success"
    else
        __kobman_echo_red "test-kob-upgrade failed"
    fi
}
__test_kob_run