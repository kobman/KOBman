#!/bin/bash

status="true"

function __test_kob_init
{
    source $KOBMAN_DIR/src/kobman-utils.sh
    __kobman_echo_no_colour "checking for kob"
    if [[ -d $KOBMAN_DIR ]]; then
        __kobman_echo_no_colour "kob found"
        source $KOBMAN_DIR/bin/kobman-init.sh
        status="true"
    else
        status="false"
        return 1
    fi
    environments="von-network TheOrgBook greenlight KOBDflow KOBConnect KOBVON KochiOrgBook KOBman KOBRegistry"
    __kobman_echo_no_colour "checking for installed environments...."
    for i in $environments; do
        if [[ ! -d $KOBMAN_DIR/envs/kob_env_$i ]]; then
            __kobman_echo_no_colour "No environments installed"
            __kobman_echo_no_colour "Please install an enivronment first"
            status="false"
            return 1
        fi
    done
}

function __test_kob_execute
{
    __kobman_echo_no_colour "Executing status command"
    kob status >> tmp.txt

}

function __test_kob_validate
{
    
}



function __test_kob_run
{
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup

}

__test_kob_run
