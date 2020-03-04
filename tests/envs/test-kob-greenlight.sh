#!/bin/bash
#Check kob exists
# Check if greenlight is already installed echo , cannot run the test failed
# kob install greenlight
# check if greenlight env is available for installation
# run the kob list command
kob list > output.txt
# check status
# Initialize the variables for running the install command 
 test_namespace="hyperledgerkochi"
 test_env_name="greenlight"
 test_installation_type="--dev"
 
# run the environment install command with different parameters ( supported)  
kob install $test_installation_type $test_env_name $test_namespace > output.txt

# check if the necessary files or utilities required for development are placed in thecorrent location using file exists check
# check kob status $test_
# check kob uninstall $test_env_name 
# check kob status
