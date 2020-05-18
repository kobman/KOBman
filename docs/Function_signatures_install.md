
# &#x1F4D8; Install Commands/Function Signatures





## Listing down the existing installation commands and its function signatures
	
### <span>&#8284;</span> Development environement installation commands/function signatures:

*The values of the arguments accepted by the function "kob" is exported as environment variables which later on recalls in other functions.*

**common execution file for installation commands - KOBman/src/main/bash/commands/kobman-main.sh**



        function kob                                    Argument:$0 $1 $2 $3 $4           return :?

**common executed file for installation commands - KOBman/src/main/bash/commands/kobman-install.sh**

        function __kob_install                          Argument:$1            return :


### <span>&#10146;</span> kobman development environement installation commands/signatures:

**command**
       
        kob install --dev kobman       [name_space]       
        

**executed file - KOBman/src/main/bash/env/kobman-kobman.sh**

	function __kobman_install_kobman             	 Argument:$4             return :
	function __kobman_development_kobman_dir         Argument:             return :
       
       

### <span>&#10146;</span> tobvon development environement installation commands/signatures:

**command**    

        kob install --dev tobvon       [name_space]       
        
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**

        function __kobman_install_tobvon             	 Argument:             return :
	function __kobman_development_tobvon_dir         Argument:             return :
        
### <span>&#10146;</span> tob development environement installation commands/signatures:
  
  **command**
  
        kob install --dev tob          [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	function __kobman_install_tob               	  Argument:             return :
        function __kobman_development_tob_dir             Argument:             return :
	
### <span>&#10146;</span> greenlight development environement installation commands/signatures:

**command**

        kob install --dev greenlight   [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-greenlight.sh**

	    function __kobman_install_greenlight               Argument:             return :
        function __kobman_development_greenlight_dir         Argument:             return :

### <span>&#10146;</span> kobvon development environement installation commands/signatures:
        
**command**

	kob install --dev kobvon       [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_install_kobvon               	   Argument:             return :
        

### <span>&#10146;</span> kob development environement installation commands/signatures:

**command**

        kob install --dev kob          [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**

	    function __kobman_install_kob               	   Argument:             return :
        
	
### <span>&#10146;</span> kobdflow development environement installation commands/signatures:

**command**

        kob install --dev kobdflow     [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobdflow.sh**

	    function __kobman_install_kobdflow                Argument:             return :
        
	
### <span>&#10146;</span> kobconnect development environement installation commands/signatures:

**command**

        kob install --dev kobconnect   [name_space]   / work in Progress 
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**

	    function __kobman_install_kobconnect               Argument:             return :
        
	
### <span>&#10146;</span> kobregistory development environement installation commands/signatures:

**command**

        kob install --dev kobregistory [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_install_kobregistory              Argument:             return :
        



## <span>&#8284;</span> Deployment environement setup commands/signatures:



### <span>&#10146;</span> tobvon deployment environement installation commands/signatures:
       
**command**

        kob install --deploy tobvon       [name_space]       
        
**executed file - KOBman/src/main/bash/env/kobman-tobvon.sh**

        function __kobman_install_tobvon             	 Argument:             return :
	function __kobman_development_tobvon_dir         Argument:             return :
        function __kobman_start_tobvon               	 Argument:             return :
       
        
### <span>&#10146;</span> tob deployment environement installation commands/signatures:

**command**

        kob install --deploy tob          [name_space]

**executed file - KOBman/src/main/bash/env/kobman-tob.sh**

	function __kobman_install_tob               	  Argument:             return :
	function __kobman_development_tob_dir         Argument:             return :
        function __kobman_start_tob                 	  Argument:             return :
       
	
### <span>&#10146;</span> greenlight deployment environement installation commands/signatures:

**command**

        kob install --deploy greenlight   [name_space]
	
**executed file - KOBman/src/main/bash/env/kobman-tobdflow.sh**
	
	    function __kobman_install_greenlight               Argument:             return :
	    function __kobman_development_greenlight_dir         Argument:             return :
        function __kobman_start_greenlight                 Argument:             return :
       

### <span>&#10146;</span> kobvon deployment environement installation commands/signatures:

**command**

        kob install --deploy kobvon       [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobvon.sh**

	    function __kobman_install_kobvon               	   Argument:             return :
        function __kobman_start_kobvon                 	   Argument:             return :
  
		
### <span>&#10146;</span> kob deployment environement installation commands/signatures:

**command**

        kob install --deploy kob          [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kob.sh**

	    function __kobman_install_kob               	   Argument:             return :
        function __kobman_start_kob                 	   Argument:             return :

	
### <span>&#10146;</span> kobdflow deployment environement installation commands/signatures:

**command**

        kob install --deploy kobdflow     [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobdlow.sh**

	    function __kobman_install_kobdflow                Argument:             return :
        function __kobman_start_kobdflow                  Argument:             return :

	
### <span>&#10146;</span> kobconnect deployment environement installation commands/signatures:	

**command**

        kob install --deploy kobconnect   [name_space]   / work in Progress 
	
**executed file - KOBman/src/main/bash/env/kobman-kobconnect.sh**

	    function __kobman_install_kobconnect               Argument:             return :

	
### <span>&#10146;</span> kobregistory deployment environement installation commands/signatures:

**command**

        kob install --deploy kobregistory [name_space]   / work in Progress
	
**executed file - KOBman/src/main/bash/env/kobman-kobregistory.sh**

	    function __kobman_install_kobregistory              Argument:             return :


