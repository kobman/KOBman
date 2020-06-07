|     <ins> Sl.No <ins>       |    <ins> Checkpoints <ins>       |
|:----:|:----:|
| **A** |**Naming Convention**|
|A.1|All Command files will have a prefix kobman-XXXX.sh and  XXXX must be the command name|
|A.2|All Environment files will have a prefix kobman-XXXXX.sh and XXXXX  must be the environment name|
|A.3|All Internal kobman functions that will be called in other kob scripts must begin with __kob|
|A.4|All function names should have meaningful names which denote what they are intended to do|
| **B** |**Variable definition & Scoping**|
|B.1|All environment variables should be in caps (eg KOBMAN_VERSION)|
|B.2|All export variables used in a script should be initiatlized in kobman-init.sh|
|B.3|The environment variables should be invoked using export (in the beginning of the script) if they are intended to be used as is in the script|
|B.4|All local variables should be in small letters (eg argument(1))|
|B.5|The scope of local variables newly introduced should be confined to the functions they are defined in or within the script they have been defined|
|B.6|Any variable defined in a script which is to be reused in another script should be defined as Environment Variable|
| **C** |**Function Usage**|
|C.1| __kobman_echo function should be used instead of echo to display messages in the script|
|C.2| __kobman_echo_debug function should be used to display specific error message in the script|
|C.3|Functions to return -1 if they encounter any error during execution or don't satisfy the condition being validated or processed|
|C.4|Return code from function execution other than 0 to be processed for exiting from script|
| **D** |**Test Scripts**|
|D.1|All command scripts should have their correspondiing test scripts available for verification purpose and be made available along with code changes during code submission|
|D.2|All environment scripts should have their corresponding test scripts available for verification purpose and be made available along with code changes during code submission|
|:---:| :--- |
|D.3|All test scripts should have the following standard set of functions included in them – <br> __test_kob_init() <br> __ test_kob_execute() <br> __ test_kob_validate() <br> __ test_kob_cleanup() <br> __ test_kob_run()|
|D.4|"All KOBman  environment scripts should have standard set of functions included in them and follow the following naming convention <br> <br>__kob_XXXX() function  where XXXX is the corresponding command <br> <br> e.g. <br>

    __kob_install ()
    __kob_uninstall()
    __kob_update()
    __kob_upgrade()
   __kob_validate()
    __kob_start()
    __kob_stop()
     "
    
    
