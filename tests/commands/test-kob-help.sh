#!/bin/bash

function __test_kob_help
    {
        F="False"
        __kobman_init
        __kobman_check
        __kobman_execute_kob_help
        __kobman_output $F
        clean="trash.txt test_file.txt"
        for i in $clean
            do
                __kobman_clean $i
            done
    }

function __kobman_init
    {

        #KOBMAN_DIR="~/ .kobman"
        cd ~/
        CMD="install uninstall help list status"



    }
function __kobman_curl
    {
    
        curl -L https://raw.githubusercontent.com/EtricKombat/KOBman/master/get.kobman.io | bash > trash.txt
        source "/${KOBMAN_DIR}/bin/kobman-init.sh"
    }
function __kobman_check
    {


        if [ -n $KOBMAN_DIR ]
            then
                echo "Checking for .kobman"
                echo ".kobman found"
                echo "Removing .kobman for reinstalling"
                sudo rm -rf .kobman
                __kobman_curl
            else
                echo "Checking for .kobman"
                echo ".kobman not found"
                echo "Installing .kobman"
                __kobman_curl
        fi       

    }


function __kobman_execute_kob_help

    {   
        echo "Executing kob help for testing"
        kob help > test_file.txt
        #kob help
        #echo "after kob help"
        #$_test_file=tmp.txt
        for i in $CMD 
            do
                #echo $i
                __kobman_validating_help test_file.txt $i
            done
    }   

function __kobman_validating_help
    {   
        
       #echo "inside __test_kob_help"
        if cat $1 | grep -i -q $2
            then
                F="True"
            else
                F="False" 
        fi
    }
function __kobman_output
    {
        _flag=$1
        if [ "$_flag" = "True" ]
            then
                echo "test-kob-help Success"
            else
                echo "test-kob-help Fail"
        fi                
}
function __kobman_clean
    {
        rm $1    
    
    }
__test_kob_help
exit
