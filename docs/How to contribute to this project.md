## Contributing

We greatly value the feedback and contributions of our users. We have a simple process in place to facilitate this:

### Bugs and New Features

We keep a distinction between New Features and Bugs/Issues. We try to minimise the noise in our Github Issues stream by first having a conversation on [KochiOrgBook! Whatsapp Group](https://chat.whatsapp.com/El6d3aAc6pYLEDEdQPVABY).

- User Issues can be raised in our issue section.
- New Features or Enhancements can be discussed in our issue section.

After accepting a new feature or confirming that a bug was found, an Issue may be raised filling in the provided Issue Template on the Kobman issue tracker.

**Unfortunately we will close any Github Issues that have not followed this process of prior discussion.**

### Pull Requests

[Make a pull r, but make sure to initiate discussion on Whatsapp Group followed by a Github Issue as described above. The PR template is to be filled in before submission, ensuring that it is _linked back_ to the Github Issue number by replacing `#XXX` with the appropriate [Issue reference](https://github.com/EtricKombat/KOBman/blob/master/docs/ISSUE_TEMPLATE.md).



Each PR should also be accompanied by a passing test(s) proving it's validity (where feasible). 



### Go through the following steps to add a new environment

Fork from the  <a href="https://github.com/EtricKombat/KOBman">master repository</a>  

Open your terminal and install git using the below command 
  
			$ sudo apt install git
  
Clone your local repository by typing the below command

			$ git clone http://github.com/<user name>/KOBman
      
Save your environment shell script in the path KOBman/src/main/bash/env

Follow the naming convention, for example if the environment name is "abc", then the file name should be "kob-abc.sh"

Save the test script of your environment in the folder KOBman/tests/envs 

The name of the test script should follow the naming convention. For example if the name of the environment is "abc.sh" then the test script name should be "__test-kob-abc.sh"

In your terminal type the below command 

      $ git add .
      
Commit the changes using the below command

      $ git commit . -m "<type your message here>"
      
Push the changes into your local repository by using the below command

      $ git push
      
Go to your local repository and make a pull request to reflect the changes in the master repository

