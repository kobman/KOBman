# GREENLIGHT

## The GreenLight Business Scenario
The business problem addressed in this demo is a business trying to get Business Permits and Licences in their local municipality. Getting such authorizations are complicated processes, often requiring contacting multiple jurisdictions to acquire multiple credentials - licenses, permits, registrations, etc., each of which may require the presentation of previously acquired credentials from other sources. GreenLight simplifies the problem by:

* Asking the user to select the business goal they are trying to achieve. For example, a Business Licence to open a restaurent, or a "Dog and Cat Breeder" permit.

* Starting from the goal, evaluating the Hyperledger Indy prerequisite proof request to determine the credentials needed to acquire that credential.

* Repeating that process for each pre-requisite credential until all the necessary licenses are determined

* Presenting the user with a list of the credentials needed and the order of acquisition necessary to meet the prerequisites - e.g. starting from the credentials that have no prerequisites.

* Laying over that the list of Credentials the business has already acquired.

* Allowing the user to click from the list of needed credentials screen to either the application for that credential (if not yet acquired), or to TheOrgBook screen to see the already acquired credential.

## Prerequisites
* KOBman utility should be installed. Check out <a href="https://github.com/hyperledgerkochi/KOBman/blob/master/README.md">steps</a> on how to install KOBman   
* VON should be up and running. Check out <a href="https://github.com/TEJAlions/KOBman/blob/master/docs/von-network.md">steps</a> on how to install and run VON   
* OrgBook should be up and running.Check out <a href="https://github.com/Akshaydevsv21/KOBman/blob/master/docs/tob_setup_docs.md">steps</a> on how to install and run The Org Book   

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

## Stopping project

There are two commands to stop the project

        $ ./manage stop

and

        $ ./manage down
        
`stop` only stops the containers, but leaves the rest of the docker-compose structure in place - volumes (and the Indy wallets they store) and networking.

`down` is destructive, removing the volumes and network elements.
        
## Using the Application

* The GreenLight user interface is exposed at http://localhost:5000/

To confirm the application initialization is complete, go to the GreenLight screen and look at the Credentials drop down. It should have all of the Credentials for the Issuer/Verifier Agents listed

        




