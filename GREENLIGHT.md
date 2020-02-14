# GREENLIGHT

## Prerequisites
* KOBman utility should be installed. Check out <a href="https://github.com/EtricKombat/KOBman/blob/master/README.md">KOBman  readme</a> on how to install KOBman   
* VON should be up and running. Check out the link on how to install and run VON
* OrgBook should be up and running.Check out the link on how to install and run OrgBook

## Building Greenlight

Go to your terminal and type the following command

        $ kob install --dev greenlight hyperledgerkochi

This will build the Greenlight environment in your system.

## Running Greenlight

On your terminal type the following command to change the directory.

        $ cd ~/kobman/greenlight/docker
        
In that directory type the command

        $ ./manage start

This will start your greenlight.

After the greenlight is successfully deployed go to the link and check for the output
 http://localhost:5000
        



