#!/usr/bin/env bash


function __kob_use {
	local candidate version install

	candidate="$1"
	version="$2"
	__kobman_check_version_present "$version" || return 1
	__kobman_check_candidate_present "$candidate" || return 1
	__kobman_determine_version "$candidate" "$version" || return 1

	if [[ ! -d "${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" ]]; then
		echo ""
		__kobman_echo_red "Stop! ${candidate} ${VERSION} is not installed."
		return 1
	fi

	# Just update the *_HOME and PATH for this shell.
	__kobman_set_candidate_home "$candidate" "$VERSION"

	# Replace the current path for the candidate with the selected version.
	if [[ "$solaris" == true ]]; then
		export PATH=$(echo $PATH | gsed -r "s!${KOBMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}!g")

	elif [[ "$darwin" == true ]]; then
		export PATH=$(echo $PATH | sed -E "s!${KOBMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}!g")

	else
		export PATH=$(echo "$PATH" | sed -r "s!${KOBMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${KOBMAN_CANDIDATES_DIR}/${candidate}/${VERSION}!g")
	fi

	if [[ ! ( -h "${KOBMAN_CANDIDATES_DIR}/${candidate}/current" || -d "${KOBMAN_CANDIDATES_DIR}/${candidate}/current" ) ]]; then
		__kobman_echo_green "Setting ${candidate} version ${VERSION} as default."
		__kobman_link_candidate_version "$candidate" "$VERSION"
	fi

	echo ""
	__kobman_echo_green "Using ${candidate} version ${VERSION} in this shell."
}
