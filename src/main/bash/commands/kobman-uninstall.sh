#!/usr/bin/env bash

function __kob_uninstall {

local environment version
environment=$1
version=$2
__kobman_check_parameter_present "$environment" "$version" || return 1

# Condition where all the envs and its available versions will be removed
if [[ $environment == "all" && -z $version ]]; then
  
  __kobman_echo_white "This operation would remove all the environments and its files"
  __kobman_interactive_uninstall || return 1
  __kobman_echo_white "Removing files..."
  rm -rf $KOBMAN_DIR/envs/kob_env_*
  rm -rf ~/Dev_*
  __kobman_echo_green "Files removed successfully."
# Condition where no current file is present and the user executes uninstall without version parameter
elif [[ ! -f $KOBMAN_DIR/envs/kob_env_$environment/current && -z $version ]]; then
  __kobman_echo_violet "Something went wrong"
  __kobman_echo_violet "Please re-install $environment and try again"
# Condition where current file is present and the user executes uninstall to remove the current version  
elif [[ -f $KOBMAN_DIR/envs/kob_env_$environment/current && $version == $(cat $KOBMAN_DIR/envs/kob_env_$environment/current) ]]; then  

  __kobman_echo_white "This operation would remove the current version $version for $environment"
  __kobman_echo_cyan "This would leave the environment without a current"
  __kobman_interactive_uninstall || return 1
  __kobman_echo_no_colour "Uninstalling version $version of $environment"
  rm $KOBMAN_DIR/envs/kob_env_$environment/current 
  rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version 
  # To remove the folder kob_env_$environment if its empty
  l=$(ls $KOBMAN_DIR/envs/kob_env_$environment)
  if [[ -z $l ]]; then
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment
  fi
  __kobman_uninstall_$environment
  __kobman_echo_green "Version $version for $environment has been uninstalled successfully"
 # 1) Current file is present and the user prompts to remove a previous version and 2) Current file is not present and the user prompts to reove a previous version 
elif [[ -f $KOBMAN_DIR/envs/kob_env_$environment/current && $version != $(cat $KOBMAN_DIR/envs/kob_env_$environment/current) || ! -f $KOBMAN_DIR/envs/kob_env_$environment/current && -d $KOBMAN_DIR/envs/kob_env_$environment/$version   ]]; then  

  __kobman_echo_white "$version for $environment is not the current version"
  __kobman_echo_white "The operation will still remove the files for the version."
  __kobman_interactive_uninstall || return 1
  __kobman_echo_no_colour "Removing files..."
  rm -rf $KOBMAN_DIR/envs/kob_env_$environment/$version
  # To remove the folder kob_env_$environment if its empty
  l=$(ls $KOBMAN_DIR/envs/kob_env_$environment)
  if [[ -z $l ]]; then
    rm -rf $KOBMAN_DIR/envs/kob_env_$environment
  fi
  __kobman_echo_green "Files removed successfully."


fi

} 




