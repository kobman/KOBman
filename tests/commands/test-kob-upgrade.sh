#!/bin/bash
function __test_kob_init
{
    if [[ ! -d $KOBMAN_DIR ]]; then
        echo "kobman not found"
        echo "Please install kobman first and try again"
        exit 1
    fi

}

function __test_kob_execute
{
    kob upgrade >> $HOME/output.txt
}

function __test_kob_validate
{

}

function __test_kob_cleanup
{
    rm $HOME/output.txt
}
function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
}