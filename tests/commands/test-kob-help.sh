#!/bin/bash
STATUS="Testing"
function __test_kob_help
{
    
    __kobman_init
    __kobman_execute_kob_help
    for i in $commands
        do
            if [ $STATUS = Testing ];
                then
                    __kobman_validating_help test_file.txt $i
                else
                    __kobman_cleanup test_file.txt
                    __kobman_test_kob_help_output $STATUS
                
            fi
        done
    for i in $files_to_remove
        do
            __kobman_cleanup $i
        done
    
    __kobman_test_kob_help_output $STATUS
    
    

}

function __kobman_init
{

    #KOBMAN_DIR="~/ .kobman"
    cd ~/
    commands="install uninstall help list status version"
    namespace=EtricKombat
    files_to_remove="test_file.txt"
    echo "Checking for kobman......."
    if [ ! -d ${KOBMAN_DIR} ];
        then
            echo ".kobman not found"
            echo "Installing .kobman........"
            curl -s -L https://raw.githubusercontent.com/${namespace}/KOBman/master/get.kobman.io | bash &> /dev/null
            echo "Sourcing files to memory......."
            source "/${KOBMAN_DIR}/bin/kobman-init.sh"
        else
            echo ".kobman found"
            echo "Sourcing files to memory......."
            source "/${KOBMAN_DIR}/bin/kobman-init.sh"
    fi
    
}


function __kobman_execute_kob_help

{   
    echo "Executing kob help for testing"
    kob help > test_file.txt
}   

function __kobman_validating_help
{   
    if cat $1 | grep -i -q $2
        then
            STATUS="Testing"
        else
            STATUS="Fail"
            echo "Command $2 not found" 
            
            
    fi
}

function __kobman_test_kob_help_output
{
    if [ $STATUS = "Testing" ]
        then
            echo "test-kob-help Success"
        else
            echo "test-kob-help Fail"
            exit
 
    fi                
}

function __kobman_cleanup
{
    rm $1    

}
__test_kob_help
exit
