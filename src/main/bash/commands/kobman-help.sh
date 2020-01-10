#!/usr/bin/env bash

#
#   Copyright 2017 Marco Vermeulen
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

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
