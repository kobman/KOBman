#!/usr/bin/env bash


function __kob_help {
	__kobman_echo_no_colour ""
	__kobman_echo_no_colour "Usage: kob <command> [environment] "
	__kobman_echo_no_colour ""
	__kobman_echo_no_colour "   commands:"
	__kobman_echo_no_colour "       install   or i    [--dev] <environment> [namespace]"
	__kobman_echo_no_colour "       uninstall or rm   <environment> <version>"
	__kobman_echo_no_colour "       list      or ls   [environment]"
	__kobman_echo_no_colour "       version   or v"
	__kobman_echo_no_colour "       status or s"
	__kobman_echo_no_colour "       help      or h"
	__kobman_echo_no_colour ""
	__kobman_echo_no_colour "   environment  :  the KOB to install: tob,tobvon,greenlight.. etc."
	__kobman_echo_no_colour "                 use list command for comprehensive list of environments"
	__kobman_echo_no_colour "                 eg: \$ kob list"
	__kobman_echo_no_colour "   --dev        :for setting up development environment"

	__kobman_echo_no_colour "   --deploy     :for deploying specific environment"
	__kobman_echo_no_colour "                 eg: \$ kob --dev install tobvon"
	__kobman_echo_no_colour "   namespace    :  you can use this for setup dev env from you forked version"
	__kobman_echo_no_colour "                 eg: \$ kob install --dev tobvon hyperledgerkochi"
	__kobman_echo_no_colour ""
}
