#!/bin/bash

# version=$1
# if [[ -z $version ]]; then
#     echo "Usage: ./test-kob-Aries-Cloudagent-Python <version_tag>"
#     exit 1
# fi
environment="Aries-dev"
function __test_kob_init
{
    if [[ ! -d $KOBMAN_DIR ]]; then
        echo "kob not found"
        exit 1
    else
        source $KOBMAN_DIR/bin/kobman-init.sh
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
    fi

    # if [[ -z $KOBMAN_USER_NAMESPACE ]]; then
    #     __kobman_echo_no_colour "User namespace not found"
    #     exit 1
    # fi
    

    if [[ ! -d $KOBMAN_ARIES_ENV_ROOT ]]; then
        __kobman_echo_no_colour "Dev environment for $environment is not installed"
        __kobman_echo_no_colour "Please install it first and try again"
        exit 1
    fi

}

# function __test_kob_execute
# {
#     #skipping execute part
# }

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating.."
    local return_val=$(__kobman_validate_aries-dev "$environment")
    if [[ $return_val == "1" ]]; then
        test_status="failed"
        return 1
    fi
    unset return_val
}

# function __test_kob_cleanup
# {
#     # Anything to be cleaned up should be mentioned here
# }

function __test_kob_run
{
    test_status="success"
    __test_kob_init
    # __test_kob_execute
    __test_kob_validate
    # __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-Aries-dev success"
    else
        __kobman_echo_red "test-kob-Aries-dev failed"
    fi
}
__test_kob_run
