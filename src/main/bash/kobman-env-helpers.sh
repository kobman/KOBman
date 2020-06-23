#!/usr/bin/env bash


function __kobman_check_parameter_present
{

  local environment=$1
  local version=$2

  kob status > status.txt

  cat status.txt | grep -w $environment | grep -qw $version
  if [[ "$?" != "0" ]]; then
    __kobman_echo_red "Parameter not found in the local system."
    return 1
  fi
  rm status.txt
}


function __kobman_interactive_uninstall
{
 
  
  read -p "Would you like to proceed?(y/n):" c
    if [[ $c == "n" ]]; then
      __kobman_echo_no_colour "Exiting!!!"
      return 1
    else
      return 0
    fi
}


