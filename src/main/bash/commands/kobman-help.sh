#!/usr/bin/env bash

function __kob_help {
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

remove 	      : $ kob rm
		Removes KOBman utility and installed environments 
		from the local system
EOF
}