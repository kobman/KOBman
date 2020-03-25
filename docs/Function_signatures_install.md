
# INSTALLATION Commands Function Signatures





## Listing down the existing installation commands and its function signatures
	
### Development environement installation commands/function signatures:



**common execution file for installation commands - KOBman/src/main/bash/commands/kobman-main.sh**

        function kob                                    Argument:$0 $1 $2 $3 $4           return :?

**common executed file for installation commands - KOBman/src/main/bash/commands/kobman-install.sh**

        function __kob_install                          Argument:$1            return :


### kobman development environement installation commands/signatures:

**command**
       
        kob install --dev kobman       [name_space]       
        

**executed file - KOBman/src/main/bash/env/kobman-kobman.sh**

	function __kobman_install_kobman             	 Argument:$4             return :
	function __kobman_development_kobman_dir         Argument:             return :
       
       

### tobvon development environement installation commands/signatures:

**command**    

        kob install --dev tobvon       [name_space]       
        
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**

        function __kobman_install_tobvon             	 Argument:             return :

        
### tob development environement installation commands/signatures:
  
  **command**
  
        kob install --dev tob          [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	function __kobman_install_tob               	  Argument:             return :
        function __kobman_version_tob               	  Argument:             return :
	
### greenlight development environement installation commands/signatures:

**command**

        kob install --dev greenlight   [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-greenlight.sh**

	    function __kobman_install_greenlight               Argument:             return :
        function __kobman_version_greenlight               Argument:             return :

### kobvon development environement installation commands/signatures:
        
**command**

	kob install --dev kobvon       [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_install_kobvon               	   Argument:             return :
        function __kobman_version_  kobvon             	   Argument:             return :

### kob development environement installation commands/signatures:

**command**

        kob install --dev kob          [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**

	    function __kobman_install_kob               	   Argument:             return :
        function __kobman_version_kob               	   Argument:             return :
	
### kobdflow development environement installation commands/signatures:

**command**

        kob install --dev kobdflow     [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobdflow.sh**

	    function __kobman_install_kobdflow                Argument:             return :
        function __kobman_version_kobdflow                Argument:             return :
	
### kobconnect development environement installation commands/signatures:

**command**

        kob install --dev kobconnect   [name_space]   / work in Progress 
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**

	    function __kobman_install_kobconnect               Argument:             return :
        function __kobman_version_kobconnect               Argument:             return :
	
### kobregistory development environement installation commands/signatures:

**command**

        kob install --dev kobregistory [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_install_kobregistory              Argument:             return :
        function __kobman_version_kobregistory              Argument:             return :



## Deployment environement setup commands/signatures:



### tobvon deployment environement installation commands/signatures:
       
**command**

        kob install --deploy tobvon       [name_space]       
        
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**

        function __kobman_install_tobvon             	 Argument:             return :
        function __kobman_start_tobvon               	 Argument:             return :
       
        
### tob deployment environement installation commands/signatures:

**command**

        kob install --deploy tob          [name_space]

**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	    function __kobman_install_tob               	  Argument:             return :
        function __kobman_start_tob                 	  Argument:             return :
       
	
### greenlight deployment environement installation commands/signatures:

**command**

        kob install --deploy greenlight   [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-tobdflow.sh**
	
	    function __kobman_install_greenlight               Argument:             return :
        function __kobman_start_greenlight                 Argument:             return :
        function __kobman_version_greenlight               Argument:             return :

### kobvon deployment environement installation commands/signatures:

**command**

        kob install --deploy kobvon       [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_install_kobvon               	   Argument:             return :
        function __kobman_start_kobvon                 	   Argument:             return :
        function __kobman_version_kobvon               	   Argument:             return :
		
### kob deployment environement installation commands/signatures:

**command**

        kob install --deploy kob          [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**

	    function __kobman_install_kob               	   Argument:             return :
        function __kobman_start_kob                 	   Argument:             return :
        function __kobman_version_kob               	   Argument:             return :
	
### kobdflow deployment environement installation commands/signatures:

**command**

        kob install --deploy kobdflow     [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobdlow.sh**

	    function __kobman_install_kobdflow                Argument:             return :
        function __kobman_start_kobdflow                  Argument:             return :
        function __kobman_version_kobdflow                Argument:             return :
	
### kobconnect deployment environement installation commands/signatures:	

**command**

        kob install --deploy kobconnect   [name_space]   / work in Progress 
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**

	    function __kobman_install_kobconnect               Argument:             return :
        function __kobman_version_kobconnect               Argument:             return :
	
### kobregistory deployment environement installation commands/signatures:

**command**

        kob install --deploy kobregistory [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_install_kobregistory              Argument:             return :
        function __kobman_version_kobregistory              Argument:             return :



## Uninstall environement  commands/function signatures:


### tobvon development environement uninstallation commands/signatures:
       
**command**

        kob uninstall --dev tobvon
	
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**
	
	    function __kobman_uninstall_tobvon             Argument:             return :
	
### tob development environement uninstallation commands/signatures:

**command**

        kob uninstall --dev tob         
	
**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	    function __kobman_uninstall_tob             Argument:             return :
        
### greenlight development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev greenlight  
	
**executed file - KOBman/src/main/bash/env/kobman-tobdflow.sh**

	    function __kobman_uninstall_greenlight             Argument:             return :
        
### kobvon development environement uninstallation commands/signatures:	
	
**command**

	kob uninstall --dev kobvon     
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_uninstall_kobvon             Argument:             return :
	
### kob development environement uninstallation commands/signatures:
	
**command**

	kob uninstall --dev kob          
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**
        	
	    function __kobman_uninstall_kob             Argument:             return :
	
### kobdflow development environement uninstallation commands/signatures:
	
**command**

	kob uninstall --dev kobdflow     

**executed file - KOBman/src/main/bash/env/kobman-kobdflow.sh**
        
	    function __kobman_uninstall_kobdflow             Argument:             return :
	
### kobconnect development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev kobconnect   
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**
        
	    function __kobman_uninstall_kobconnect             Argument:             return :
	
### kobregistory development environement uninstallation commands/signatures:

**command**

	kob uninstall --dev kobregistory 
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_uninstall_kobregistory             Argument:             return :
        
Other useful commands:        
  
             
        kob list
        kob status        
        kob help     
        kob version     
