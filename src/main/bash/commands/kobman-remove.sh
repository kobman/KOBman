#!/bin/bash

function __kob_remove
{
    __kobman_echo_red "This operation would remove the KOBman utility and installed environments"
    __kobman_interactive_uninstall || return 1 
    if [[ -d $KOBMAN_ENV_ROOT ]]; then
        __kobman_echo_no_colour "Removing dev environment"
        rm -rf $KOBMAN_ENV_ROOT
    fi

    if [[ -d $KOBMAN_DIR ]]; then
        __kobman_echo_no_colour "Removing utility..."
        rm -rf $KOBMAN_DIR
    fi
    __kobman_echo_no_colour "Removing environment variables..."
    unset KOBMAN_DIR KOBMAN_ENV_ROOT KOBMAN_VERSION KOBMAN_NAMESPACE KOBMAN_USER_NAMESPACE KOBMAN_INTERACTIVE_USER_MODE
    __kobman_echo_green "KOBman utility removed successfully."
    sed -i '/.kobman/d' $HOME/.bashrc
    exec bash

    

}

