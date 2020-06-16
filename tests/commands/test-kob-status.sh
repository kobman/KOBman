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
    
    # __kobman_echo_no_colour "Checking for installed environments...."
    env_folder=($(find $KOBMAN_DIR/envs/ -name "kob_env_*" -print))
    # if [[ -z $env_folder ]]; then
    #     __kobman_echo_no_colour "No environments installed"
    #     __kobman_echo_no_colour "Please install an enivornment first and try again"
    #     __kobman_echo_no_colour "Exiting!!!"
    #     status="false"
    #     return 1
    # else
    #     __kobman_echo_no_colour "Environments found"
    #     __kobman_echo_no_colour "Proceeding with the test..."
    # fi
    __kobman_echo_no_colour "creating and sourcing dummyenv files..."
    touch $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc
  
    fake_publish_dummyenv
  
    create_install_dummyenv_script > $path_to_kob_envs/kobman-$kobman_env_name.sh
    source $KOBMAN_DIR/bin/kobman-init.sh
}

function __test_kob_execute
{
    kob status >> state1.txt
    __kobman_echo_no_colour "Executing install command for various versions of dummyenv"
    __kobman_echo_white "Version-0.0.2"
    kob install --environment dummyenv --version 0.0.2
    kob status >> state2.txt
    cat state2.txt
    __kobman_echo_white "Version-0.0.3"
    kob install --environment --version 0.0.3
    kob status >> state3.txt
    cat state3.txt
    __kobman_echo_no_colour "Uninstalling dummyenv - version 0.0.2"
    __kobman_uninstall_dummyenv 0.0.2
    kob status >> state4.txt
    cat state4.txt

}

function __test_kob_validate
{

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
    if [[ "$?" != "0" ]]; then
        __kobman_echo_no_colour "~ is not against the last installed environment"
        status="false"
        return 1
    fi
}   

function __test_kob_cleanup
{
    rm tmp.txt
}

function create_install_dummyenv_script(){
  
cat <<EOF
#!/bin/bash
function __kobman_install_dummyenv
{
  
  cd ~
  if [ ! -d "Dev_dummyenv" ]; then 
    
    __kobman_create_dev_environment 
    __kobman_echo_white "dummyenv installed"
  else
    
    rm -rf ~/Dev_dummyenv	
    __kobman_create_dev_environment  
    __kobman_echo_white "dummyenv installed"
    
  fi		
}
function __kobman_uninstall_dummyenv
{
    version=$1
}
function __kobman_update_dummyenv
{
    __kobman_echo_white "update"
}
function __kobman_upgrade_dummyenv
{
    __kobman_echo_white "upgraded"
}
function __kobman_start_dummyenv
{
    __kobman_echo_white "start"
}
function __kobman_stop_dummyenv
{
    __kobman_echo_white "stop"
}
function __kobman_create_dev_environment 
{
	 
	cd ~
	mkdir -p Dev_dummyenv
	cd Dev_dummyenv
	export DUMMYENV_DEV_DIR=$PWD
	mkdir -p test/ dependency/
}
EOF
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