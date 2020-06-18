#!/usr/bin/env bash

function __kob_uninstall {

local environment version
environment=$1
version=$2

__kobman_check_if_env_present "$environment" || return 1
__kobman_check_if_version_present "$environment" "$version" || return 1

if [[ $version == $(cat $KOBMAN_DIR/envs/kob_env_$environment/current) ]]; then  
  __kobman_echo_white "This operation would remove the current version $version and reinstall with an existing version."
  read -p "Would you like to proceed?(y/n):" c
    if [[ $c == "n" ]]; then
      __kobman_echo_no_colour "Exiting!!!"
      return 1
    else
      __kobman_echo_no_colour "Uninstalling version $version of $environment"
      rm $KOBMAN_DIR/envs/kob_env_$environment/current 
      rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version 
      rm -rf ~/Dev_$environment
      __kobman_echo_green "Version $version for $environment has been uninstalled successfully"

    fi
    __kobman_install_next_version $environment  
else
  __kobman_echo_white "$version for $environment is not the current version"
  __kobman_echo_white "The operation will still remove the files for the version."
  read -p "Would you like to proceed?(y/n):" c
  if [[ $c == n ]]; then
    __kobman_echo_no_colour "Exiting!!!"
    return 1
  else
    __kobman_echo_no_colour "Removing files..."
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version
    __kobman_echo_green "Files removed successfully."
  fi
fi
} 
function __kobman_check_if_env_present
{

  local environment=$1
  kob status > status.txt
  cat status.txt | grep -qw $environment
  if [[ "$?" != "0" ]]; then
    __kobman_echo_red "$environment has not been installed"
    return 1
  fi
  
#   unset environment
rm status.txt
}
function __kobman_check_if_version_present
{

  local environment=$1
  local version=$2

  kob status > status.txt

  cat status.txt | grep -w $environment | grep -qw $version
  if [[ "$?" != "0" ]]; then
    __kobman_echo_red "Version $version for $environment has not been installed"
    return 1
  fi
  rm status.txt
}

function __kobman_install_next_version
{
  local environment=$1
  local version
  local count=($(find $KOBMAN_DIR/envs/kob_env_$environment/* -maxdepth 0 -type d | wc -l))
  if [[ $count > "1" ]]; then
    __kobman_echo_no_colour "More than 1 version available for $environment"
    ls -l $KOBMAN_DIR/envs/kob_env_$environment | grep ^d | awk '{print $9}'
    read -p "Enter the vesion to install:" version
    __kob_install $environment $version
  else
    version=($(ls -l $KOBMAN_DIR/envs/kob_env_$environment | grep ^d | awk '{print $9}'))
    __kob_install $environment $version
  fi
}
