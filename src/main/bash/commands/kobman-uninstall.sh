#!/usr/bin/env bash

function __kob_uninstall {

local environment version
environment=$1
version=$2

if [[ $environment == "all" ]]; then
  if [[ $INTERACTIVE_MODE == "true" ]]; then
    __kobman_echo_white "This operation would remove all the environments and its files"
    __kobman_interactive_uninstall || return 1
    __kobman_echo_white "Removing files..."
    rm -rf $KOBMAN_DIR/envs/kob_env_*
    rm -rf ~/Dev_*
    __kobman_echo_white "Files removed successfully."
    return 0
  else
    
    __kobman_echo_white "Removing files..."
    rm -rf $KOBMAN_DIR/envs/kob_env_*
    rm -rf ~/Dev_*
    __kobman_echo_white "Files removed successfully."
    return 0
  fi
fi

__kobman_check_parameter_present "$environment" "$version" || return 1

if [[ $version == $(cat $KOBMAN_DIR/envs/kob_env_$environment/current) ]]; then  
  if [[ $INTERACTIVE_MODE == "true" ]]; then
    __kobman_echo_white "This operation would remove the current version $version for $environment"
    __kobman_interactive_uninstall || return 1
    __kobman_echo_no_colour "Uninstalling version $version of $environment"
    __kobman_echo_no_colour "This would leave the environment without a current"
    rm $KOBMAN_DIR/envs/kob_env_$environment/current 
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version 
    __kobman_uninstall_$environment
    __kobman_echo_green "Version $version for $environment has been uninstalled successfully"
  else
    
    __kobman_echo_no_colour "Uninstalling version $version of $environment"
    __kobman_echo_no_colour "This would leave the environment without a current"
    rm $KOBMAN_DIR/envs/kob_env_$environment/current 
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version 
    __kobman_uninstall_$environment
    __kobman_echo_green "Version $version for $environment has been uninstalled successfully"

  fi
else
  if [[ $INTERACTIVE_MODE == "true" ]]; then
  __kobman_echo_white "$version for $environment is not the current version"
  __kobman_echo_white "The operation will still remove the files for the version."
  __kobman_interactive_uninstall || return 1
     __kobman_echo_no_colour "Removing files..."
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version
    __kobman_echo_green "Files removed successfully."
  else
    __kobman_echo_no_colour "Removing files..."
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version
    __kobman_echo_green "Files removed successfully."
  fi
fi
} 




