### Go through the following steps to add a new environment

Fork from the given link https://github.com/EtricKombat/KOBman

Open your terminal and install git using the below command 
  
			$ sudo apt install git
  
Clone your local repository by typing the below command

			$ git clone http://github.com/<user name>/KOBman
      
Save your environment shell script in the path KOBman/src/main/bash/env

Follow the naming convention, for example if the environment name is "abc.sh", then the file name should be "kob-abc.sh"

Save the test script of your environment in the folder KOBman/tests/envs 

The name of the test script should follow the naming convention. For example if the name of the environment is "abc.sh" then the test script name should be "__test-kob-abc.sh"

In your terminal type the below command 

      $ git add .
      
Commit the changes using the below command

      $ git commit . -m "<type your message here>"
      
Push the changes into your local repository by using the below command

      $ git push
      
Go to your local repository and make a pull request to reflect the changes in the master repository

