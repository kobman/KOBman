#!/usr/bin/env bash


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
