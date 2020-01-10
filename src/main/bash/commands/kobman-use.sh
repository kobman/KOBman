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
