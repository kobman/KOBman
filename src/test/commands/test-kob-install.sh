#!/bin/bash

path_to_kob_envs="${KOBMAN_DIR}/envs"
path_to_kob_env_tests=~/KOBman/tests/envs
kobman_env_name=${1:-dummyenv}
version=$2
KOBMAN_NAMESPACE=${KOBMAN_NAMESPACE:-hyperledgerkochi}
status="true"



function __test_kob_init {
  source $KOBMAN_DIR/src/kobman-utils.sh
  __kobman_echo_no_colour "checking for kob..."

  if [[ -d ${KOBMAN_DIR} ]]; then

    __kobman_echo_no_colour "kob found"
    source "${KOBMAN_DIR}/bin/kobman-init.sh"
  
  else
  
    __kobman_echo_no_colour "kob not found"
    __kobman_echo_no_colour "installing kobman...."
    curl -L https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/get.kobman.io | bash > /dev/null 2>&1
    source "${KOBMAN_DIR}/bin/kobman-init.sh"
  
  fi
  
  __kobman_echo_no_colour "creating and sourcing dummyenv files..."
  touch $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc
  
  fake_publish_dummyenv
  
  create_install_dummyenv_script > $path_to_kob_envs/kobman-$kobman_env_name.sh
  
  touch $path_to_kob_env_tests/test-kob-${kobman_env_name}.sh
  create_dummyenv_validation_script > $path_to_kob_env_tests/test-kob-${kobman_env_name}.sh
  
  source $path_to_kob_envs/kobman-$kobman_env_name.sh


}

function __test_kob_execute {

  __kobman_echo_no_colour "executing install command..."
  kob install --environment ${kobman_env_name} --version $version > ~/output.txt
  
   
  cat ~/output.txt | grep -q "dummyenv installed"
  
  if [[ "$?" == "0" ]]; then
  
    __kobman_echo_no_colour "0" > $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc
    kob status
  
  else
  
    __kobman_echo_no_colour "1" > $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc    
  
  fi
}


function __test_kob_validate {
  __kobman_echo_no_colour "validating install command...."
  . $path_to_kob_env_tests/test-kob-${kobman_env_name}.sh  > ~/tmp.txt
  

  
  if [[ $(cat $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc) == "1" ]]; then
    
    __kobman_echo_no_colour "install command did not execute properly"
    status="fail"
    
    __test_kob_cleanup
    
    return 1
  
  fi

  tail -1 ~/tmp.txt | grep -q "success"
  if [[ "$?" != "0" ]]; then
  
    __kobman_echo_no_colour "output of dummy env validate is: failed"
    status="fail"
    __test_kob_cleanup
  
    return 1
  fi
  
  if [[ ! -d ~/Dev_${kobman_env_name} ]]; then
    
    __kobman_echo_no_colour "Dev_${kobman_env_name} was not found in the /home folder"
    status="fail"
    __test_kob_cleanup
    
    return 1
  
  fi
  
  if [[ ! -d $KOBMAN_DIR/envs/kob_env_${kobman_env_name} || $(cat $KOBMAN_DIR/envs/kob_env_${kobman_env_name}/current) != $version ]]; then
    
    __kobman_echo_no_colour "error in .kobman/envs"
    status="fail"
    __test_kob_cleanup
    
    return 1
  
  fi


  status="true"
  __kobman_echo_green "test-kob-install success"
   
  return 0
  
}





function __test_kob_cleanup()
{

  rm ~/output.txt ~/tmp.txt  $path_to_kob_envs/kobman-$kobman_env_name.sh $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc
  rm -rf ~/Dev_$kobman_env_name
  rm -rf $KOBMAN_DIR/envs/kob_env_$kobman_env_name
  rm $path_to_kob_env_tests/test-kob-$kobman_env_name.sh
  sed -i "s/dummyenv,0.0.2,0.0.3,0.0.5,0.0.7,0.0.9//g" $KOBMAN_DIR/var/list.txt 

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
    __kobman_echo_white "uninstall"
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

function create_dummyenv_validation_script()
{

cat <<EOF
  #!/bin/bash
  status="true"
  function __test_kob_dummyenv_run
  {
    __test_kob_init || return 1
    
    __test_kob_execute
    
    __test_kob_validate || return 1
    __test_kob_dummyenv_cleanup
    __test_kob_output
  }
  function __test_kob_init
  {
    
    if [[ ! -d ~/Dev_dummyenv ]]; then
      
      status="false"
      __test_kob_output
      return 1
    else
      
      return 0

    fi

  }
  function __test_kob_execute
  {
    
    touch ~/dummy.txt
    # echo "output of execute of dummyenv" > ~/dummy.txt
    

    

  }
  function __test_kob_validate
  {
    
    
    ls ~ | grep -qw "dummy.txt"
    if [[ "$?" != "0" ]]; then
      status="false"
      __test_kob_output
      __test_kob_dummyenvcleanup
      return 1
    fi

    if [[ "$(cat $KOBMAN_DIR/var/kobman_env_$kobman_env_name.proc)" == "1" ]]; then
      
      status="false"
      __test_kob_output
      __test_kob_dummyenvcleanup
      return 1

    fi

    commands="uninstall update upgrade start stop"
    for i in $commands; do
        __kobman_$i_dummyenv | grep $i
        if [[ "$?" != "0" ]]; then
            __kobman_echo_white "error with $i"
            status="false"
            __test_kob_dummyenvcleanup
            __test_kob_output
            return 1
        fi
    done
    status="true"
    
    __test_kob_output
    return 0 
  }

  function __test_kob_dummyenv_cleanup
  {
    rm -rf ~/dummy.txt
  }

  function __test_kob_output
  {
    
    if [[ $status == "true" ]]; then
      echo "success"
    else
      echo "failed"
    fi
  }
  __test_kob_dummyenv_run


EOF
}

function fake_publish_dummyenv
{
  
  rm $KOBMAN_DIR/var/list.txt

  __kobman_secure_curl https://raw.githubusercontent.com/${KOBMAN_NAMESPACE}/KOBman/master/dist/list.txt > $KOBMAN_DIR/var/list.txt
  

  __kobman_echo_no_colour "dummyenv,0.0.2,0.0.3,0.0.5,0.0.7,0.0.9" >> $KOBMAN_DIR/var/list.txt
  
  
  source $KOBMAN_DIR/bin/kobman-init.sh
  
}
function __test_kob_run
{
  if [[ $status=="true" ]]; then
  
    __test_kob_init
  
  else

    
    __kobman_echo_red "test-kob-install failed" 
    return 1
  
  fi

  if [[ $status=="true" ]]; then
  
    __test_kob_execute
  
  else
    
    __kobman_echo_red "test-kob-install failed" 
    return 1
  
  fi
  if [[ $status=="true" ]]; then
  
    __test_kob_validate
  
  else
    
    __kobman_echo_red "test-kob-install failed" 
    return 1
  
  fi
  if [[ $status == "true" ]]; then
      __test_kob_cleanup
  else
    __kobman_echo_red "test-kob-install failed"
    return 1
  fi
 

}
__test_kob_run





