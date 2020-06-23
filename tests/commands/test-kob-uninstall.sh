#!/bin/bash

path_to_kob_envs="${KOBMAN_DIR}/envs"
path_to_kob_env_tests=~/KOBman/tests/envs
environment=$1
version=$2
if [[ -z $environment || -z $version ]]; then
    echo "Usage: ./test-kob-uninstall.sh <env_name> <version>"
fi
]


