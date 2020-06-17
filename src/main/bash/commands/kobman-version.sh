#!/usr/bin/env bash



function __kob_version {

        local environment_type environment_name

        environment_type=$ENVIRONMENT_TYPE
        environment_name=$NAME_SPACE
        if [ "$DEPLOYMENT_TYPE" == "" ]
        then
                cd "${KOBMAN_DIR}/var"
                cat version.txt
                cd ~
        else
                __kobman_environment_version "$environment_type" "$environment_name"
        fi
}



function __kobman_environment_version {

        local environment_type environment_name
        environment_type=$1
        environment_name=$2
        if [ "$environment_type" == "--environment" ]
        then

                __kobman_version_${environment_name}
        fi
}
