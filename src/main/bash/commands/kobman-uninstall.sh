#!/usr/bin/env bash

function __kob_uninstall {

local environment version
environment=$1
version=$2

# Condition where all the envs and its available versions will be removed
if [[ $environment == "all" && -z $version ]]; then
  
  __kobman_echo_white "This operation would remove all the environments and its files"
  __kobman_interactive_uninstall || return 1
  __kobman_echo_white "Removing files..."
  __kobman_secure_curl "https://raw.githubusercontent.com/$KOBMAN_NAMESPACE/KOBman/master/dist/environments" >> $HOME/env_tmp.txt
  sed -i 's/,/ /g' $HOME/env_tmp.txt
  local curled_environment=$(cat $HOME/env_tmp.txt)
  for i in ${curled_environment[@]}; do
    if [[ -d $KOBMAN_DIR/envs/kobman-$i ]]; then
      __kobman_uninstall_$i "$i"
    fi
  done
  [ -f $HOME/env_tmp.txt ] && rm $HOME/env_tmp.txt
  find $KOBMAN_DIR/envs -maxdepth 1 -mindepth 1 -type d -exec rm -rf '{}' \;
  unset curled_environment
  __kobman_echo_green "Files removed successfully."
# Condition where no current file is present and the user executes uninstall without version parameter
elif [[ ! -f $KOBMAN_DIR/envs/kobman-$environment/current && -z $version ]]; then
  __kobman_echo_violet "Something went wrong"
  __kobman_echo_violet "Please re-install $environment and try again"
# Condition where current file is present and the user executes uninstall to remove the current version  
elif [[ -f $KOBMAN_DIR/envs/kobman-$environment/current && $version == $(cat $KOBMAN_DIR/envs/kobman-$environment/current) ]]; then  

  __kobman_echo_white "This operation would remove the current version $version for $environment"
  __kobman_echo_cyan "This would leave the environment without a current"
  __kobman_interactive_uninstall || return 1
  __kobman_echo_no_colour "Uninstalling version $version of $environment"
  __kobman_uninstall_$environment "$environment"
  rm $KOBMAN_DIR/envs/kobman-$environment/current 
  rm -rf $KOBMAN_DIR/envs/kobman-$environment/$version 
  # To remove the folder kobman-$environment if its empty
  l=$(ls $KOBMAN_DIR/envs/kobman-$environment)
  if [[ -z $l ]]; then
    rm -rf $KOBMAN_DIR/envs/kobman-$environment
  fi
  __kobman_echo_green "Version $version for $environment has been uninstalled successfully"
 # 1) Current file is present and the user prompts to remove a previous version and 2) Current file is not present and the user prompts to reove a previous version 
elif [[ -f $KOBMAN_DIR/envs/kobman-$environment/current && $version != $(cat $KOBMAN_DIR/envs/kobman-$environment/current) || ! -f $KOBMAN_DIR/envs/kobman-$environment/current && -d $KOBMAN_DIR/envs/kobman-$environment/$version   ]]; then  

  __kobman_echo_white "$version for $environment is not the current version"
  __kobman_echo_white "The operation will still remove the files for the version."
  __kobman_interactive_uninstall || return 1
  __kobman_echo_no_colour "Removing files..."
  rm -rf $KOBMAN_DIR/envs/kobman-$environment/$version
  # To remove the folder kobman-$environment if its empty
  l=$(ls $KOBMAN_DIR/envs/kobman-$environment)
  if [[ -z $l ]]; then
    rm -rf $KOBMAN_DIR/envs/kobman-$environment
  fi
  __kobman_echo_green "Files removed successfully."


fi

} 




