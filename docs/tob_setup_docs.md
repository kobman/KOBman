#documentation on setting up TheKochiOrgBook

**Prerequisites**
-----------------

1.Von network should be setup.For more information regarding setting up Von network refer [here!].


**Local Environment Installation** 
----------------------------------
* Run the *dev* command.
This will download all the dependencies required for setting up development Environment for OrgBook.

>kob install --dev tob \[namespace]\

  > Example: kob install --dev tob hyperledgerkochi

* Run the *deploy* command.

>kob install --deploy tob \[name_space\]

 > Example: kob install --deploy tob hyperledgerkochi 
 
* On successful deployment the dependencies will be present in the following folder:

> /.kobman/candidates

* After deployment, the OrgBook will be running under the following port by default :

> https://localhost:8080/en/home




















