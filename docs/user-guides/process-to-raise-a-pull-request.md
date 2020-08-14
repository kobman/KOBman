
# Process to raise a pull request


### Pull request from developer's point of view

It is recommended to create a new branch in developer's local github repository for working on new code changes/features .
Once developer's code change has completed the developer should make a pull request to any other [contributor's](https://github.com/hyperledgerkochi/KOBman/network/members) 
recommended branch to test the code out based on the [checklist](https://github.com/hyperledgerkochi/KOBman/blob/master/docs/KOBman%20Script%20Review%20Checklist.md) . 

A developer/contributor is recommeded to follow the listed steps , for successful merge of their code pull requests. 

**step 1:** For avoiding future merge conflicts sync your master repository with hyperledgerkochi/master (eg :hyperledgerkochi/master - > EtricKombat/master)

**step 2:** Sync you local master branch with remote branch (recommended)

**step 3:** create a new branch from synced master branch with assigned (optional eg: RF-xxxx ) 

**step 4:** sync you local branch with remote branch (recommended)



____________________________________

### Pull request from code reviewer's point of view

The contributor merge this isolated code to the local branch created specifically for this code review.
and tests out the functionalty,do a thorough review based on the [checklist provided by the team hyperledgerkochi](https://github.com/hyperledgerkochi/KOBman/blob/master/docs/KOBman%20Script%20Review%20Checklist.md). Once the the contributor feels like the code is reliable ,
they should provide a LGTM approval in the hyperledgerkochi/KOBman's [pull section](https://github.com/hyperledgerkochi/KOBman/pulls). Only then the code get merged to hyperledgerkochi/KOBman's github [master repository](https://github.com/hyperledgerkochi/KOBman).

**step 1:** Merge the pull request to new_branch created specifically for testing this pull (which should be synced with hyperledgerkochi/master )

**step 3:** Once merged need to test it out by releasing a local version and install/test kob utility from the code reviewers local system.

**step 4:** If the functionality is working as expected , do thorough code review based on [checklist ](https://github.com/hyperledgerkochi/KOBman/blob/master/docs/KOBman%20Script%20Review%20Checklist.md)

**step 5:** Finally if the code passes the checklist , give a LGTM approval 


### other recommended steps:
**step :** The title of the pull request should match the issue raised related to the same.

**step :** 
**step :** 
**step :** 
**step :** 
**step :** 
**step :** 
**step :** 
**step :** 

