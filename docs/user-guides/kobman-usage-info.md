## 1. <ins> Install Command <ins> ##

	$ kob install --environment/-env {some-env-name} [--namespace {repo-namespace}]

- **Command Arguments** :

	-  `install` - Install KOB environment on the host with X.Y.Z version number format.
	-  `--environment/-env` - Type of KOB environment to be installed on the host.
	-  `{some-env-name}` - Name of the environment.
	-  `--namespace` - KOB namespace parameter.
	-  `{repo-namespace}` - Namespace of any specific github user who has forked KOB projects.

- **Examples** :

	- tobvon dev  environment installation 

			$ kob install --environment tobvon --namespace hyperledgerkochi
	 	**Output** :
	 	*tobvon installed*

## 2. <ins> Deploy Command <ins> ##

	$ kob deploy --environment {some-env-name } [--namespace {repo-namespace}]


- **Command Arguments** :     
	- `deploy` - Deploy KOB environment on the host with X.Y.Z version number format.
	- `--environment/-env` - Type of KOB environment to be installed on the host.
	- `{some-env-name}` - Name of the environment.
	- `--namespace` - KOB namespace parameter.
	- `{repo-namespace}` - Namespace of any specific github user who has forked KOB projects.

- **Examples** :

	- greenlight environment deploy

			$ kob deploy --environment greenlight --namespace hyperledgerkochi
		
		**Output** :
		*greenlight is deployed*

## 3. <ins> Uninstall Command <ins> ##
	
	$ kob uninstall --environment {some-env-name}
	
- **Command Arguments** :
	- `uninstall` - Uninstall KOB environment on the host.
	- `--environment/-env` - Type of KOB environment to be un-installed.
	- `{some-env-name}` - Name of the environment

- **Examples** :

	- tobvon environment uninstallation 

			$ kob uninstall --environment tobvon 
		**Output** :
		*tobvon environment is uninstalled*

## 4. <ins> Version Command <ins> ##
	
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

		$ kob --version --environment {some-env-name}
	- **Command Arguments** :
		- `--version/-V` - Display the version 
		- `--environment/-env` - KOB environment that is installed on the host
		- `{some-env-name}` - Name of the environment
	- **Examples** :
	
		- greenlight 0.0.1 is an environment that is installed
			
				$ kob --version --environment greenlight 
		
			**Output** :
			*greenlight 0.0.1*
			
		- greenlight is an environment that is not installed
		
				$ kob -V --environment greenlight
				
			**Output** :
			*greenlight is not installed*
	
## 5. <ins> Status Command <ins> ##
	
	$ kob status
	
- **Command Arguments** :
	- `status` - Shows the presence of all  KOB  environment on the host.
	
- **Example** :
	- VON environment is present is the system
	
			$ kob status
		
		**Output** : </br>
		=========STATUS=========</br>
		*Dev_VON*
		
## 6. <ins> Help Command <ins> ##
	
	$ kob help
	
- **Command Argument**
	- `help` - Displays the details of various functions available with KOBman utility.

- **Example**
		
		$ kob help
	**Output** : </br>
	![Output of $kob help](https://github.com/asa1997/assets/blob/master/Screenshot%20from%202020-04-05%2020-56-18.png)


## 7. <ins> List Command <ins> ##
	
	$ kob list
	
- **Command Argument**
	
	- `list` - Shows the list of  KOB environments that can be managed on the host.
	
- **Example**
		
		$ kob list
	**Output** : </br>
	![Output of $ kob list](https://github.com/asa1997/assets/blob/master/Screenshot%20from%202020-04-05%2021-07-27.png)


## 8. <ins> Upgrade Command <ins> ##
	
	$ kob upgrade [--version  X.Y.Z] or $kob self-update

- **Command Arguments**
	- `upgrade` - Upgrade to a later version of KOBman 
	- `self-update`- Upgrade to a later version of KOBman
	- `--version /-V` - version of KOBman to which the current installation has to be upgraded.
	
- **Examples**
	- Default upgrade, without version, updates current installation to latest version i.e 0.0.1.
			
			$ kob upgrade
		**Output** :
		*kobman upgraded to 0.0.1*
	- Upgrade to version 0.0.1.
			
			$ kob upgrade --version 0.0.1
		**Output** :
		*kobman upgraded to 0.0.1*
	- Current version is same as latest version 
			
			$ kob upgrade --version 0.0.1
		**Output** :
		*kobman already on 0.0.1*
	- Upgrade to version 0.0.2, a version not available in master (dist) repository.
			
			$ kob upgrade --version 0.0.2
		**Output** :
		*kobman version 0.0.2 not found*


## 9. <ins> Update Command <ins> ##
	
	$ kob update [--environment {environment to be updated} --version  X.Y.Z] 

- **Command Arguments**

	- `update` - To update and check for new versions of KOBman environments.
	- `--version/-V` - Version of KOBman environment to which the current installation has to be  upgraded.
	- `--environment` - Environment to be updated.
	
- **Examples**
	- Default update, without version or environment, all new candidate environments are updated  on the host
		
			$ kob update
		**Output** :</br>
		*Kobman environments updated !*</br>
		*greenlight 0.0.1*</br>
		*tob 0.0.1*
 
 	- Update greenlight to version 0.0.1

			$ kob update –environment greenlight –version 0.0.1
		**Output** :
		*greenlight updated to 0.0.1*

	- greenlight current version is same as new version

			$ kob update –environment greenlight –version 0.0.1
		**Output** :
		*greenlight already on 0.0.1*
 
	- Update to greenlight version 0.0.2, a version not available in master (dist) repository

			$ kob upgrade –environment greenlight –version 0.0.2
		**Output** :
		*greenlight version 0.0.2 not found<ins>*





	
	
		
		






	




