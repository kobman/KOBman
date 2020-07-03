#!/bin/bash

path_to_kob_envs="${KOBMAN_DIR}/envs"
environment=$1
version=$2
if [[ -z $environment || -z $version ]]; then
    echo "Usage: ./test-kob-uninstall.sh <env_name> <version>"
    exit 1
fi
function __test_kob_init
{
    if [[ -d $KOBMAN_DIR ]]; then
        source $KOBMAN_DIR/src/kobman-utils.sh
        __kobman_echo_no_colour "kob found"
        source $KOBMAN_DIR/bin/kobman-init.sh
    else
        echo "kob not found"
        echo "Please install KOBman and try again"
        echo "Exiting!!1"
        exit 1
    fi
    if [[ ! -f $KOBMAN_DIR/var/list.txt ]]; then
        __kobman_echo_no_colour "Could not find list.txt"
        __kobman_echo_no_colour "Try reinstalling KOBman"
        __kobman_echo_no_colour "Exiting!!!"
        exit 1
    fi
    export INTERACTIVE_MODE="false"
    __kobman_echo_no_colour "Creating and sourcing dummyenv files..."
    touch $KOBMAN_DIR/var/kobman_env_$environment.proc
    create_install_dummyenv_script > $path_to_kob_envs/kobman-$environment.sh
    source $KOBMAN_DIR/src/kobman-utils.sh
    fake_publish_dummyenv
    
 
}
function __test_kob_execute
{
    __kobman_echo_no_colour "Installing dummyenv"
    kob install -env $environment -V $version >> ~/output.txt
    cat ~/output.txt | grep -q "dummyenv installed"
    if [[ "$?" == "0" ]]; then
        __kobman_echo_no_colour "0" > $KOBMAN_DIR/var/kobman_env_$environment.proc
        __kobman_echo_white "Output of status"
        __kobman_echo_white "----------------"
        kob status
    else
        __kobman_echo_no_colour "1" > $KOBMAN_DIR/var/kobman_env_$environment.proc    
    fi
    kob status >> status1.txt
    __kobman_echo_no_colour "Removing dummyenv"
    kob uninstall -env $environment -V $version
    __kobman_echo_white "Output of status"
    __kobman_echo_white "----------------"
    kob status
    kob status >> status2.txt 
}
function __test_kob_validate
{
    __kobman_echo_no_colour "validating uninstall command..."
    if [[ $(cat $KOBMAN_DIR/var/kobman_env_$environment.proc) == "1" ]]; then
        __kobman_echo_no_colour "install command did not execute properly"
        test_status="failed"
        return 1
    fi

    cat status1.txt | grep -qw $environment
    if [[ "$?" != "0" ]]; then
        __kobman_echo_no_colour "install command did not execute properly"
        test_status="failed"
        return 1
    fi

    cat status2.txt | grep -qw $environment
    if [[ "$?" == "0" ]]; then
        
        __kobman_echo_no_colour "uninstall command did not execute properly"
        test_status="failed"
        return 1
    fi   

    if [[ -f $KOBMAN_DIR/envs/kobman_env_$environment/$version/kobman-$environment.sh ]]; then
        __kobman_echo_no_colour "Uninstall did not remove the file kob_env_$environment/$version/kobman-$environment.sh"
        test_status="failed"
        return 1
    fi

    if [[ -d $KOBMAN_DIR/envs/kobman_env_$environment/$version ]]; then
        __kobman_echo_no_colour "Uninstall command did not remove the folder kob_env_$environment/$version"
        test_status="failed"
        return 1
    fi

    if [[ -d ~/Dev_$environment ]]; then
        __kobman_echo_no_colour "Uninstall command did not remove the folder $HOME/$USR/Dev_$environment"
        test_status="failed"
        return 1
    fi
}

function __test_kob_cleanup
{
    rm ~/output.txt status*.txt $KOBMAN_DIR/var/kobman_env_$environment.proc $path_to_kob_envs/kobman-$environment.sh
    sed -i "s/dummyenv,0.0.2,0.0.3,0.0.5,0.0.7,0.0.9//g" $KOBMAN_DIR/var/list.txt
}

function fake_publish_dummyenv
{
  __kobman_echo_no_colour "dummyenv,0.0.2,0.0.3,0.0.5,0.0.7,0.0.9" >> $KOBMAN_DIR/var/list.txt 
  source $KOBMAN_DIR/bin/kobman-init.sh
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
    rm  -rf ~/Dev_dummyenv

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
    test_status="success"
    __test_kob_init
    __test_kob_execute
    __test_kob_validate
    __test_kob_cleanup
    if [[ $test_status == "success" ]]; then
        __kobman_echo_green "test-kob-uninstall success"
    else
        __kobman_echo_red "test-kob-uninstall failed"
    fi
}
__test_kob_run




