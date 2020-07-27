# &#x1F4D9; Uninstall Commands/Function Signatures

## Listing down the existing uninstallation commands and its function signatures

*The values of the arguments accepted by the function "kob" is exported as environment variables which later on recalls in other functions.*

**common execution file for installation commands - KOBman/src/main/bash/commands/kobman-main.sh**

        function kob                                    Argument:$0 $1 $2 $3 $4           return :?

**common executed file for installation commands - KOBman/src/main/bash/commands/kobman-uninstall.sh**

        function __kob_uninstall                          Argument:$1            return :


 
### <span>&#10146;</span> tobvon development environement uninstallation commands/signatures:
       
**command**

        kob uninstall --dev tobvon
	
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**
	
	    function __kobman_uninstall_tobvon             Argument:             return :



### <span>&#10146;</span> tob development environement uninstallation commands/signatures:

**command**

        kob uninstall --dev tob         
	
**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	    function __kobman_uninstall_tob             Argument:             return :
 


### <span>&#10146;</span> greenlight development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev greenlight  
	
**executed file - KOBman/src/main/bash/env/kobman-tobdflow.sh**

	    function __kobman_uninstall_greenlight             Argument:             return :


 
### <span>&#10146;</span> kobvon development environement uninstallation commands/signatures:	
	
**command**

	kob uninstall --dev kobvon     
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_uninstall_kobvon             Argument:             return :


 
### <span>&#10146;</span> kob development environement uninstallation commands/signatures:
	
**command**

	kob uninstall --dev kob          
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**
        	
	    function __kobman_uninstall_kob             Argument:             return :


 
### <span>&#10146;</span> kobdflow development environement uninstallation commands/signatures:
	
**command**

	kob uninstall --dev kobdflow     

**executed file - KOBman/src/main/bash/env/kobman-kobdflow.sh**
        
	    function __kobman_uninstall_kobdflow             Argument:             return :


 
### <span>&#10146;</span> kobconnect development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev kobconnect   
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**
        
	    function __kobman_uninstall_kobconnect             Argument:             return :


 
### <span>&#10146;</span> kobregistory development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev kobregistory 
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_uninstall_kobregistory             Argument:             return :
        
