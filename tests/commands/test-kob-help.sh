#!/bin/bash

function __test_kob_init
{
	if [[ ! -d $KOBMAN_DIR ]]; then
        echo "kob not found"
        echo "Please install KOBman and try again"
        echo "Exiting!"
        exit 1
    else
    	source $KOBMAN_DIR/bin/kobman-init.sh
    	source $KOBMAN_DIR/src/kobman-utils.sh
        
    fi
    create_help_template_script > $HOME/help_template.txt
    source $KOBMAN_DIR/src/kobman-utils.sh
}

function __test_kob_execute
{
    kob help > $HOME/help_output.txt
}

function __test_kob_validate
{
    __kobman_echo_no_colour "Validating help command..."
    diff $HOME/help_template.txt $HOME/help_output.txt
    if [[ ! "$?" == 0 ]]; then
    		__kobman_echo_no_colour "help command did not give the desired output"
       		test_status="failed"
        	return 1
   	fi
}

function __test_kob_cleanup
{
    rm $HOME/help_output.txt $HOME/help_template.txt
}

function create_help_template_script(){

cat << EOF 
KOBman - Help 
---------------------------------------------------------
$ kob <command> <qualifer> 

<qualifier>   : environment, version, namespace

<command> 
 ----------------------------------------------------------
install       : $ kob install –env [env_name] -V [version]
		The command is used to install the specified
		environment.
		Eg: $ kob install -env von-network –V 0.0.2

uninstall     : $ kob uninstall --environment [env_name]
		or
		$ kob uninstall –env [env_name] -V [version]
		The command is used to uninstall the specified
		environment.
		Eg: $ kob uninstall –env KOBman

status        : $ kob status
		The command displays the installed environments.

list          : $ kob list
		The command lists the various environment that
		can be installed.

upgrade       : $ kob upgrade
		Upgrades KOBman to next version available.

update        : $ kob update
		Updates the list file with lastest changes.

version       : Version of KOBman Utility
		-------------------------
		$ kob --version or kob –V
		This command displays the version of KOBman
		installed on the host.

		Version of an Environment
		-------------------------
		$ kob -V -env [env_name]
		The command displays the version of the specified
		environment.
		Eg: $ kob -V -env greenlight

help          : $ kob help
		Displays the KOBman manual
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
        __kobman_echo_green "test-kob-help success"
    else
        __kobman_echo_red "test-kob-help failed"
    fi
}
__test_kob_run
