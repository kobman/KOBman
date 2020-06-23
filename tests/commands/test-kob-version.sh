
#!/bin/bash

status="true"

function __test_kob_init
{
    echo "Checking for kob..."
    if [[ -d $KOBMAN_DIR ]]; then
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
        source $KOBMAN_DIR/bin/kobman-init.sh
    else
        status="false"
        echo "kob not found"
        echo "Please install KOBman first and try again"
        echo "Exiting!!!"
        exit 1

    fi

    __kobman_echo_no_colour "Checking for installed version file...."

    env_version=($(find $KOBMAN_DIR/var/ -name "version.txt" -print))
    if [[ -z $env_version ]]; then
         __kobman_echo_no_colour "No version file found"
         __kobman_echo_no_colour "Please re-install and try again"
         __kobman_echo_no_colour "Exiting!!!"
         status="false"
         return 1
    else
         __kobman_echo_no_colour "version file found "
         __kobman_echo_no_colour "Proceeding with the test..."
    fi

}

function __test_kob_execute
{
    __kobman_echo_no_colour "Executing version command"
    kob version >> tmp.txt

}

function __test_kob_validate
{

    __kobman_echo_no_colour "Validating...."

    cat tmp.txt | grep -w $(cat $KOBMAN_DIR/var/version.txt)
    if [[ "$?" != "0" ]]; then
        __kobman_echo_no_colour "no version details available"
        status="false"
        return 1
    fi
}

function __test_kob_cleanup
{
    rm tmp.txt
}

function __test_kob_run
{
    if [[ $status == "true" ]]; then
        __test_kob_init
    else
        return 1
    fi

    if [[ $status == "true" ]]; then
        __test_kob_execute
    else
        return 1
    fi

    if [[ $status == "true" ]]; then
        __test_kob_validate
    else
        __test_kob_cleanup
        return 1
    fi
    __test_kob_cleanup

}

__test_kob_run
if [[ $status == "true" ]]; then
    __kobman_echo_green "test-kob-version success"
else
    __kobman_echo_red "test-kob-version failed"
fi
