# KOBman

**KOBman** , is a command line utility inspired from sdkman !! 
KOBman gives you a **kob** command on your shell , you can use it to automate the setup of various development environments required for KochiOrgBook projects.



# KOBman! CLI
### The KochiOrgBook Manager Command Line Interface<!--Text-->

<!--Text-->

<!--
<!--[![Build Status](https://travis-ci.org/kobman/kobman-cli.svg?branch=master)](https://travis-ci.org/kobman/kobman-cli)
[![Latest Version](https://api.bintray.com/packages/kobman/generic/kobman-cli/images/download.svg) ](https://bintray.com/kobman/generic/kobman-cli/_latestVersion)
[![Backers on Open Collective](https://opencollective.com/kobman/backers/badge.svg)](#backers) 
[![Sponsors on Open Collective](https://opencollective.com/kobman/sponsors/badge.svg)](#sponsors)
[![Slack](https://slack.kobman.io/badge.svg)](https://slack.kobman.io)
-->

KOBman is a utility for managing parallel versions of multiple KochiOrgBook projects on any unix based system. It provides a convenient command line interface for installing, removing and listing environments.

See documentation on the [KOBman! website](https://github.com/EtricKombat/KOBman/blob/master/docs/Environment%20Installation.md).

## Step 1:Installation

Open your favourite terminal and enter the following:

    $ curl -L https://raw.githubusercontent.com/hyperledgerkochi/KOBman/master/get.kobman.io | bash

If the environment needs tweaking for KOBman to be installed, the installer will prompt you accordingly and ask you to remove '~/.kobman' directory and restart your machine .


## Step 2:Local Installation

To install KOBman locally running against your local server, run the following commands:

	
	$ source ~/.kobman/bin/kobman-init.sh



## Step 3:Local Environment Installation

Run the following commands on the terminal to manage respective environments.
	
	Development environement setup commands:
       
        kob install --dev tobvon       [name_space]       
        kob install --dev tob          [name_space]
        kob install --dev greenlight   [name_space]
        
        Example   :
            kob install --dev tob hyperledgerkochi
        
Deployment commands:
        
        kob install --deploy tobvon       [name_space]       
        kob install --deploy tob          [name_space]
        kob install --deploy greenlight   [name_space]
               
	Example   :
            kob install --deploy tob hyperledgerkochi
Uninstall environement  commands:
       
        kob uninstall --dev tobvon             
        kob uninstall --dev tob         
        kob uninstall --dev greenlight  
       
            
        
Other useful commands:        
               
        kob list
        kob status        
        kob help     
        kob version     
         

## Adding new features

For new features creation , you have to edit (add file 'kobman-\' ) extention script in the below listed directory,test it & publish

        .kobman/
        ├── archives
        ├── bin
        │   ├── kobman-init.sh
        │   └── kobman-test.sh
        ├── candidates
        ├── env
        │   ├── kobman-kobconnect.sh
        │   ├── kobman-kobdflow.sh
        │   ├── kobman-kobman.sh
        │   ├── kobman-kobregistery.sh
        │   ├── kobman-kob.sh
        │   ├── kobman-kobvon.sh
        │   ├── kobman-tobdflow.sh
        │   ├── kobman-tob.sh
        │   └── kobman-tobvon.sh
        ├── etc
        │   └── config
        ├── src
        │   ├── kobman-greenlight.sh
        │   ├── kobman-help.sh
        │   ├── kobman-install.sh
        │   ├── kobman-list.sh
        │   ├── kobman-main.sh
        │   ├── kobman-status.sh
        │   ├── kobman-uninstall.sh
        │   ├── kobman-utils.sh
        │   └── kobman-version.sh
        ├── tests
        │   ├── test-kob-greenlight.sh
        │   ├── test-kob-help.sh
        │   ├── test-kob-install.sh
        │   ├── test-kob-kobconnect.sh
        │   ├── test-kob-kobdflow.sh
        │   ├── test-kob-kobregistery.sh
        │   ├── test-kob-kob.sh
        │   ├── test-kob-kobvon.sh
        │   ├── test-kob-list.sh
        │   ├── test-kob-status.sh
        │   ├── test-kob-tob.sh
        │   ├── test-kob-tobvon.sh
        │   ├── test-kob-uninstall.sh
        │   └── test-kob-version.sh
        ├── tmp
            ├── kobm        an-0.01.zip
            ├── kobman-test.zip
            └── stage



## Contributors

This project exists thanks to all the people who contribute. 

**Connect with us**

<a href="https://chat.whatsapp.com/El6d3aAc6pYLEDEdQPVABY"><img src="https://www.freepnglogos.com/uploads/whatsapp-logo-image-15.png" height="30" width="70"/></a><a href="https://slack.com/signin"><img src="https://www.b2bnn.com/wp-content/uploads/2019/01/Screen-Shot-2019-01-17-at-2.29.34-PM.png" height="30" width="70"/></a><a href="https://www.meetup.com/Kochi-Blockchain-Meetup/events/"><img src="https://logodix.com/logo/2173878.png" height="30" width="70"/></a> 

