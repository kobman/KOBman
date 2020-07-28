#!/bin/bash
version=$1
if [[ -z $version ]]; then
    echo "Usage: ./test-kob-KOBman.sh <version_tag>"
    exit 1
fi
environment=KOBman
function __test_kob_init
{
    if [[ ! -d $KOBMAN_DIR ]]; then
        echo "KOBman utility not found"
        echo "Please install the utility first and try again"
        echo "Exiting!!!"
        exit 1
    else
        source $KOBMAN_DIR/bin/kobman-init.sh
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
    fi
    if [[ -z $KOBMAN_USER_NAMESPACE ]]; then
        __kobman_echo_no_colour "User namespace not found"
        exit 1
    fi
    touch $KOBMAN_DIR/var/kob_env_$environment.proc
    export KOBMAN_INTERACTIVE_USER_MODE="false"
}

function __test_kob_execute 
{
    __kobman_echo_no_colour "Installing $environment..."
    kob install -env $environment -V $version >> $HOME/ts1_result.out
    if [[ -d $KOBMAN_ENV_ROOT ]]; then
        echo "0" > $KOBMAN_DIR/var/kob_env_$environment.proc
        find $KOBMAN_ENV_ROOT -type d -name "$environment" -print >> $HOME/ts2_result.out
        find $KOBMAN_ENV_ROOT -type d -name "dependecy" -print >> $HOME/ts2_result.out
        find $KOBMAN_DIR/envs -type d -name "kobman-$environment" -print >> $HOME/ts3_result.out
        find $KOBMAN_DIR/envs/kobman-$environment -type d -name "$version" -print >> $HOME/ts3_result.out
        find $KOBMAN_DIR/envs/kobman-$environment/$version -type f -name "kobman-$environment.sh" -print >> $HOME/ts3_result.out
        kob status
        __kobman_echo_no_colour "Uninstalling $environment..."
        kob uninstall -env $environment >> $HOME/ts4_result.out

    else
        echo "1" > $KOBMAN_DIR/var/kob_env_$environment.proc
    fi
    
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating $environment dev environment"
    local return_from_validate
    if [[ $(cat $KOBMAN_DIR/var/kob_env_$environment.proc) == "1" ]]; then
        tail -1 $HOME/ts1_result.out
        __kobman_echo_no_colour "Installing failed"
        test_status="failed"
        return 1
    fi
    
    return_from_validate=$(__kobman_validate_$environment "$environment" "$version")
    if [[ $return_from_validate == "1" ]]; then
        test_status="failed"
    fi
    unset return_from_validate

}

function __test_kob_cleanup
{
    rm $HOME/*.out $KOBMAN_DIR/var/kob_env_$environment.proc
}
function __test_kob_run
{
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-KOBman success"
    else
        __kobman_echo_red "test-kob-KOBman failed"
    fi
}
__test_kob_run