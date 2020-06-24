#!/usr/bin/env bash


function __kobman_check_parameter_present
{

  local environment=$1
  local version=$2

  if [[ $environment == "all" ]]; then
    return 0
  fi

  if [[ ! -d $KOBMAN_DIR/envs/kob_env_$environment ]]; then
    __kobman_echo_red "$environment is not installed in your local system"
    return 1
  fi
  
  if [[ ! -d $KOBMAN_DIR/envs/kob_env_$environment/$version ]]; then
    __kobman_echo_red "Version $version for $environment is not installed in your system."
    return 1
  fi
  
}


function __kobman_interactive_uninstall
{
  if [[ $INTERACTIVE_MODE = "true" ]]; then
    read -p "Would you like to proceed?(y/n):" c
    if [[ $c == "n" ]]; then
      __kobman_echo_no_colour "Exiting!!!"
      return 1
    else
      return 0
    fi
  else
    return 0
  fi
}


