# GREENLIGHT
The following instructions provide details on how to build GreenLight using KOBman CLI and how to deploy it using Docker Compose. 

## Prerequisites
* KOBman utility should be installed. Check out <a href="https://github.com/EtricKombat/KOBman/blob/master/README.md">KOBman  readme</a> on how to install KOBman   
* VON should be up and running. Check out the link on how to install and run VON
* OrgBook should be up and running.Check out the link on how to install and run OrgBook

## Building project

Go to your terminal and type the following command

        $ kob install --dev greenlight hyperledgerkochi

This will build the Greenlight environment in your system.

## Starting project

On your terminal type the following command to change the directory.

        $ cd ~/kobman/greenlight/docker
        
In that directory type the command

        $ ./manage start

This will start the project.

##Stoping project

There are two commands to stop the project
        $ ./manage stop
and
        $ ./manage down
        
## USsing the Application

The GreenLight user interface is exposed at http://localhost:5000/
        



