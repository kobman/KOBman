#!/bin/bash
# version=$1
# if [[ -z $version ]]; then

#     echo "Usage: ./test-kob-KOBman.sh <version_tag>"
#     exit 1
# fi
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
    
    if [[ ! -d $KOBMAN_ENV_ROOT ]]; then
        __kobman_echo_no_colour "KOBman dev environment not installed."
        __kobman_echo_no_colour "Install the dev environment first and try again."
        exit 1
    fi
}

# function __test_kob_execute 
# {

# # By passing the execute
    
# }

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating $environment dev environment"
    local return_from_validate  
    return_from_validate=$(__kobman_validate_$environment "$environment")
    if [[ $return_from_validate == "1" ]]; then
        test_status="failed"
    fi
    unset return_from_validate

}
# No file is being created.
# function __test_kob_cleanup
# {
#     rm $HOME/*.out $KOBMAN_DIR/var/kob_env_$environment.proc
#     rm -rf $KOBMAN_DIR
# }
function __test_kob_run
{
    test_status="success"
    __test_kob_init
    # __test_kob_execute
    __test_kob_validate
    # __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-KOBman success"
    else
        __kobman_echo_red "test-kob-KOBman failed"
    fi
}
__test_kob_run