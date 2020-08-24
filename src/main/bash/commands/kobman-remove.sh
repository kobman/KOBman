#!/bin/bash

function __kob_remove
{
    __kobman_echo_red "This operation would remove the KOBman utility and installed environments"
    __kobman_interactive_uninstall || return 1 
    # if [[ -d $KOBMAN_ENV_ROOT ]]; then
    #     __kobman_echo_no_colour "Removing dev environment"
    #     rm -rf $KOBMAN_ENV_ROOT
    # fi
    __kobman_secure_curl "https://raw.githubusercontent.com/$KOBMAN_NAMESPACE/KOBman/master/dist/environments" >> $HOME/tmp_env_names.txt
    sed -i 's/,/ /g' $HOME/tmp_env_names.txt
    local environment=$(cat $HOME/tmp_env_names.txt)
    for i in $environment; do
        if [[ -d $KOBMAN_DIR/envs/kobman-$i ]]; then
        __kobman_uninstall_$i "$i"
        fi
    done
    [ -f $HOME/tmp_env_names.txt ] && rm $HOME/tmp_env_names.txt
    if [[ -d $KOBMAN_DIR ]]; then
        __kobman_echo_no_colour "Removing utility..."
        rm -rf $KOBMAN_DIR
    fi
    __kobman_echo_no_colour "Removing environment variables..."
    unset KOBMAN_DIR KOBMAN_VERSION KOBMAN_NAMESPACE KOBMAN_USER_NAMESPACE KOBMAN_INTERACTIVE_USER_MODE
    __kobman_echo_green "KOBman utility removed successfully."
    sed -i '/.kobman/d' $HOME/.bashrc
    exec bash

    

}

