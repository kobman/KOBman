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

function __kob_selfupdate {
	local force_selfupdate

	force_selfupdate="$1"
	if [[ "$KOBMAN_AVAILABLE" == "false" ]]; then
		echo "This command is not available while offline."

	elif [[ "$KOBMAN_REMOTE_VERSION" == "$KOBMAN_VERSION" && "$force_selfupdate" != "force" ]]; then
		echo "No update available at this time."

	else
		export kobman_debug_mode
		export kobman_beta_channel
		__kobman_secure_curl "${KOBMAN_CANDIDATES_API}/selfupdate?beta=${kobman_beta_channel}" | bash
	fi
	unset KOBMAN_FORCE_SELFUPDATE
}

function __kobman_auto_update {
	local remote_version version delay_upgrade

	remote_version="$1"
	version="$2"
	delay_upgrade="${KOBMAN_DIR}/var/delay_upgrade"

	if [[ -n "$(find "$delay_upgrade" -mtime +1)" && "$remote_version" != "$version" ]]; then
		echo ""
		echo ""
		__kobman_echo_yellow "ATTENTION: A new version of KOBMAN is available..."
		echo ""
		__kobman_echo_no_colour "The current version is $remote_version, but you have $version."
		echo ""

		if [[ "$kobman_auto_selfupdate" != "true" ]]; then
			__kobman_echo_confirm "Would you like to upgrade now? (Y/n): "
			read upgrade
		fi

		if [[ -z "$upgrade" ]]; then upgrade="Y"; fi

		if [[ "$upgrade" == "Y" || "$upgrade" == "y" ]]; then
			__kob_selfupdate
			unset upgrade
		else
			__kobman_echo_no_colour "Not upgrading today..."
		fi

		touch "$delay_upgrade"
	fi

}
