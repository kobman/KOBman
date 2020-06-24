## 1. <ins> Install Command <ins> ##

	$ kob install –env [env_name] -V [version] 

- **Command Arguments** :

	-  `install` - Install KOB environment on the host with X.Y.Z version number format.
	-  `--environment/-env` - Parameter to indicate the environment that is to be installed.
	-  `[env_name]` - Name of the environment to be installed.
	
- **Examples** :

	- von-network dev environment installation

			$ kob install -env von-network –V 0.0.2
	 	**Output** :
	 	*Dev environment for von-network created successfully*

## 2. <ins> Uninstall Command <ins> ##
	
	$ kob uninstall --environment {some-env-name} #please use [env_name] throughout the file to maintain consistency.
	or
	$ kob uninstall –env [env_name] -V [version]
		
- **Command Arguments** :
	- `uninstall` - Uninstall KOB environment on the host.
	- `--environment/-env` - Type of KOB environment to be un-installed.
	- `{some-env-name}` - Name of the environment.
	- `{version}` - The version for which files has to be removed.

- **Examples** :

	- KOBman environment uninstallation 

			$kob uninstall –env KOBman 
		**Output** :
		*Version {version tag} for KOBman has been uninstalled successfully*

## 3. <ins> Version Command <ins> ##
	
- **<ins>Version of KOBman Utility<ins>**

		$ kob --version or kob –V  

	- **Command Arguments** :
    	- `--version/-V` - Version of KOBman installed on the host. X.Y.Z version number format.
    	<pre> X.Y.Z (11BCF) <- Build number should correspond with a revision in source control
       ^ ^ ^
       | | |
       | | +--- Minor bugs, spelling mistakes, etc.
       | +----- Minor features, major bug fixes, etc.
       +------- Major version, UX changes, file format changes, etc.</pre>

	- **Examples** :

		- KOBman 0.0.1 is installed on the host machine 

				$ kob --version 
			**Output** :
			*kobman 0.0.1*


		- KOBman 0.0.2 is installed on the host machine

				$ kob -V
			**Output** :
			*kobman 0.0.2*

- <ins>**Version of an Environment**<ins>

		$ kob --version --environment {some-env-name} #please use [env_name] throughout the file to maintain consistency.
	- **Command Arguments** :
		- `--version/-V` - Display the version.
		- `--environment/-env` - KOB environment that is installed on the host.
		- `{some-env-name}` - Name of the environment.
	- **Examples** :
	
		- greenlight 0.0.1 is an environment that is installed
			
				$ kob --version --environment greenlight 
		
			**Output** :
			*greenlight 0.0.1*
			
		- greenlight is an environment that is not installed
		
				$ kob -V --environment greenlight
				
			**Output** :
			*greenlight is not installed*
	
## 4. <ins> Status Command <ins> ##
	
	$ kob status
	
- **Command Arguments** :
	- `status` - Show the list of environments and its versions that has been installed in the system.
	
- **Example** :
	- KOBman environment is present is the system.
	
			$ kob status
		
		**Output** : 
		<br>*Installed environments and their versions*</br>
		*------------------------------------------------------------*
		<br>~ KOBman  0.0.3*</br>
		- `“~”` represents the environment which has been installed the last. 
		- `“*”` represents the current version for each env 
		
## 5. <ins> Help Command <ins> ##
	
	$ kob help
	
- **Command Argument**
	- `help` - Displays the details of various functions available with KOBman.

- **Example**
		
		$ kob help
	**Output** : </br>
	![Output of $kob help](https://github.com/arunng21/uploads/blob/master/KOB_help.png)


## 6. <ins> List Command <ins> ##
	
	$ kob list
	
- **Command Argument**
	
	- `list` - Shows the list of  KOB environments that can be managed on the host.
	
- **Example**
		
		$ kob list
	**Output** : </br>
	*Available environments and their respective version numbers*</br>
	*---------------------------------------------------------------* </br>
	*von-network 0.0.2 0.0.3 0.0.5 0.0.7* </br>
	*TheOrgBook 0.0.2 0.0.3 0.0.5 0.0.7* </br>
	*greenlight 0.0.2 0.0.3 0.0.5 0.0.7* </br>
	*KOBman 0.0.2 0.0.3 0.0.5 0.0.7* </br>


## 7. <ins> Upgrade Command <ins> ##
	
	$ kob upgrade [--version  X.Y.Z] or $kob self-update

- **Command Arguments**
	- `upgrade` - Upgrade to a later version of KOBman.
	- `self-update`- Upgrade to a later version of KOBman.
	- `--version /-V` - version of KOBman to which the current installation has to be upgraded.
	
- **Examples**
	- Default upgrade, without version, updates current installation to latest version i.e 0.0.1.
			
			$ kob upgrade
		**Output** :
		*kobman upgraded to 0.0.1*
	- Upgrade to version 0.0.1.
			
			$ kob upgrade --version 0.0.1
		**Output** :
		*kobman upgraded to 0.0.1* or *Kobman already on 0.0.1*
	- Current version is same as latest version.
			
			$ kob upgrade --version 0.0.1
		**Output** :
		*kobman already on 0.0.1*
	- Upgrade to version 0.0.2, a version not available in master (dist) repository.
			
			$ kob upgrade --version 0.0.2
		**Output** :
		*kobman version 0.0.2 not found*


## 8. <ins> Update Command <ins> ##
	
	$ kob update [--environment {environment to be updated} --version  X.Y.Z] 

- **Command Arguments**

	- `update` - To update and check for new versions of KOBman environments.
	- `--version` - Version of KOBman to which the current installation has to be upgraded. 
	- `--environment` - Environment to be updated.
	
- **Examples**
	- Default update, without version or environment, all new candidate environments are updated  on the host.
		
			$ kob update
		**Output** :</br>
		*Kobman environments updated !*</br>
		*greenlight 0.0.1*</br>
		*tob 0.0.1*
 
 	- Update greenlight to version 0.0.1

			$ kob update --environment greenlight --version 0.0.1
		**Output** :
		*greenlight updated to 0.0.1* 

	- greenlight current version is same as new version.

			$ kob update –environment greenlight –version 0.0.1
		**Output** :
		*greenlight already on 0.0.1*
 
	- Update to greenlight version 0.0.2, a version not available in master (dist) repository.

			$ kob upgrade --environment greenlight --version 0.0.2
		**Output** :
		*greenlight version 0.0.2 not found<ins>*





	
	
		
		






	




