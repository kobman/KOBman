## 1. <ins> Install Command <ins> ##

	$ kob install –env [env_name] -V [version] 

- **Command Arguments** :

	-  `install` - Install KOB environment on the host with X.Y.Z version number format.
	-  `--environment/-env` - Parameter to indicate the environment that is to be installed.
	-  `[env_name]` - Name of the environment to be installed.
	
- **Examples** :

	- KOBman dev environment installation

			$ kob install -env KOBman –V 0.0.1
	 	**Output** :
	 	*Dev environment for KOBman created successfully*

## 2. <ins> Uninstall Command <ins> ##
	
	$ kob uninstall --environment [env_name]
	or
	$ kob uninstall –env [env_name] -V [version]
		
- **Command Arguments** :
	- `uninstall` - Uninstall KOB environment on the host.
	- `--environment/-env` - Type of KOB environment to be un-installed.
	- `[env_name]` - Name of the environment. 
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

				$ kob -V 
			**Output** :
			*KOBman utility version 0.0.1*

- <ins>**Version of an Environment**<ins>

		$ kob -V -env [env_name]
	- **Command Arguments** :
		- `--version/-V` - Display the version.
		- `--environment/-env` - KOB environment that is installed on the host.
		- `[env_name]` - Name of the environment.
	- **Examples** :
	
		- KOBman 0.0.1 is an environment that is installed
			
				$ kob -V -env KOBman 
		
			**Output** :
			*KOBman 0.0.1*
			
		- KOBman is an environment that is not installed
		
				$ kob -V --environment KOBman
				
			**Output** :
			*KOBman is not installed*
	
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
		<br>~ KOBman  0.0.1*</br>
		- `“~”` represents the environment which has been installed the last. 
		- `“*”` represents the current version for each env 
		
## 5. <ins> Help Command <ins> ##
	
	$ kob help
	
- **Command Argument**
	- `help` - Displays the details of various functions available with KOBman.

- **Example**
		
		$ kob help
	**Output** : </br>
	
![image](https://user-images.githubusercontent.com/33585301/89614366-e31ec400-d8a1-11ea-9881-d727e25f0b48.png)



## 6. <ins> List Command <ins> ##
	
	$ kob list
	
- **Command Argument**
	
	- `list` - Shows the list of  KOB environments that can be managed on the host.
	
- **Example**
		
		$ kob list
	**Output** : </br>
	*Available environments and their respective version numbers*</br>
	*---------------------------------------------------------------* </br>
	
	*KOBman 0.0.1* </br>


		
		






	




