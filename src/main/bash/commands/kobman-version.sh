#!/usr/bin/env bash


function __kob_version {


  local environment_type=$1
  local environment_value=$2

  if [ "$environment_type" == "" ]
	then
		cd "${KOBMAN_DIR}/var"
		cat version.txt
		cd ~
	else
		__kobman_environment_version "$environment_type" "$environment_value"
	fi
}



function __kobman_environment_version {

  local environment_type=$1
  local environment_value=$2

	if [ "$environment_type" == "--environment" ]
	then
			__kobman_version_"$environment_value"
	fi
}
