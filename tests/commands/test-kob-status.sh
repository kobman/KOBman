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
<<<<<<< HEAD
=======

    export KOBMAN_INTERACTIVE_USER_MODE="false"
    __kobman_echo_no_colour "Creating and sourcing dummyenv files..."
    touch $KOBMAN_DIR/var/kobman_env_$environment.proc
    create_install_dummyenv_script > $path_to_kob_envs/kobman-$environment.sh
    source $KOBMAN_DIR/bin/kobman-init.sh
    fake_publish_dummyenv
>>>>>>> 6f765c154acac1fa33980fb3502a3c2d4c600494
    
    __kobman_echo_no_colour "Checking for installed environments...."
    env_folder=($(find $KOBMAN_DIR/envs/ -name "kob_env_*" -print))
    if [[ -z $env_folder ]]; then
        __kobman_echo_no_colour "No environments installed"
        __kobman_echo_no_colour "Please install an enivornment first and try again"
        __kobman_echo_no_colour "Exiting!!!"
        status="false"
        return 1
    else
        __kobman_echo_no_colour "Environments found"
        __kobman_echo_no_colour "Proceeding with the test..."
    fi

}

function __test_kob_execute
{
<<<<<<< HEAD
    __kobman_echo_no_colour "Executing status command"
    kob status >> tmp.txt

=======
    __kobman_echo_no_colour "Installing dummyenv"
    kob install -env $environment -V $version >> $HOME/install_output.txt
    cat $HOME/install_output.txt | grep -q "dummyenv installed"
    if [[ "$?" == "0" ]]; then
        __kobman_echo_no_colour "0" > $KOBMAN_DIR/var/kobman_env_$environment.proc
        __kobman_echo_white "Output of status"
        __kobman_echo_white "----------------"
        kob status
    else
        __kobman_echo_no_colour "1" > $KOBMAN_DIR/var/kobman_env_$environment.proc    
    fi
    if [[ -f $KOBMAN_DIR/envs/kobman-$environment/current ]]; then
        cat $KOBMAN_DIR/envs/kobman-$environment/current >> $HOME/ts3_result.out
    fi
    kob status >> $HOME/ts1_result.out
    __kobman_echo_no_colour "Removing dummyenv"
    kob uninstall -env $environment -V $version >> $HOME/uninstall_output.txt
    __kobman_echo_white "Output of status"
    __kobman_echo_white "----------------"
    kob status
    kob status >> $HOME/ts2_result.out 
    
>>>>>>> 6f765c154acac1fa33980fb3502a3c2d4c600494
}

function __test_kob_validate
{

<<<<<<< HEAD
    __kobman_echo_no_colour "Validating...."
    for i in "${env_folder[@]}"; do
        n=${i##*_}
        cat tmp.txt | grep -qw $n
        if [[ "$?" != "0" ]]; then
            __kobman_echo_no_colour "could not find environemnt $n in the status"
            status="false"
            return 1
        fi
        
        cat tmp.txt | grep -w $n | grep -w "$(cat $i/current)" | grep -q "*"
        if [[ "$?" != "0" ]]; then
            __kobman_echo_no_colour "The current version is not represented properly for $n"
            status=false
            return 1
        fi
    done

    cat tmp.txt | grep -w $(cat $KOBMAN_DIR/var/current) | grep -q "~"
=======
    cat $HOME/ts1_result.out | grep -q "~ $environment  $version*"
    if [[ "$?" != "0" ]]; then
        __kobman_echo_red "Not the current version of $environment."
    fi
    
    cat $HOME/ts3_result.out | grep -q "$version"
    if [[ "$?" != "0" ]]; then
        __kobman_echo_red "Not the current version in the current file in $KOBMAN_DIR."
    fi

    cat $HOME/ts1_result.out | grep -qw $environment
>>>>>>> 6f765c154acac1fa33980fb3502a3c2d4c600494
    if [[ "$?" != "0" ]]; then
        __kobman_echo_no_colour "~ is not against the last installed environment"
        status="false"
        return 1
    fi
<<<<<<< HEAD
}   

function __test_kob_cleanup
{
    rm tmp.txt
=======

    cat $HOME/ts2_result.out | grep -qw $environment
    if [[ "$?" == "0" ]]; then
        kob status
        __kobman_echo_no_colour "$environment was found after uninstalling in the output of status"
        test_status="failed"
        return 1
    fi   


    if [[ -d $KOBMAN_DIR/envs/kobman_env_$environment/$version ]]; then
        __kobman_echo_no_colour "Could not find the folder $KOBMAN_DIR/envs/kobman_env_$environment/$version"
        test_status="failed"
        return 1
    fi
}

function __test_kob_cleanup
{
    rm $HOME/*.out $KOBMAN_DIR/var/kobman_env_$environment.proc $path_to_kob_envs/kobman-$environment.sh $HOME/*_output.txt
    sed -i "s/dummyenv,0.0.2,0.0.3,0.0.5,0.0.7,0.0.9//g" $KOBMAN_DIR/var/list.txt
>>>>>>> 6f765c154acac1fa33980fb3502a3c2d4c600494
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
    __kobman_echo_green "test-kob-status success"
else
    __kobman_echo_red "test-kob-status failed"
fi