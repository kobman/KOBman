#Documentation on setting up TheKochiOrgBook

# TheOrgBook

TheOrgBook is a Credential Registry of verifiable credentials about entities. A public instance of TheOrgBook, contains a verifiable credentials about organizations (incorporations, professionals, etc.) issued by trusted public services such as Corporate Registries, regulatory agencies, permitting services, licencing services, procurement services and the like.


![Image of TheOrgBook](https://raw.githubusercontent.com/bcgov/TheOrgBook/master/docs/assets/images/TheOrgBook-HighLevel2.png)


**Prerequisites**
-----------------

1.Von network should be setup.For more information regarding setting up Von network refer [here!].


**Local Environment Installation** 
----------------------------------
* Run the *dev* command.
This will download all the dependencies required for setting up development Environment for OrgBook.
```

kob install --dev tob [namespace]

  > Example: kob install --dev tob hyperledgerkochi

```
* Run the *deploy* command.
```

 kob install --deploy tob [name_space]

 > Example: kob install --deploy tob hyperledgerkochi 
 
 ```
* On successful deployment the dependencies will be present in the following folder:
```
  /.kobman/candidates
```
* After deployment, the OrgBook will be running under the following port by default :
```
  https://localhost:8080/en/home

```
* The OrgBook startup page will open on successful execution.


![Image of TheOrgBook Startup Page](https://camo.githubusercontent.com/5c47b6b7b0bd1e91c9bbe627b91aeaa068b47a4e/68747470733a2f2f692e696d6775722e636f6d2f6e7375726868782e706e67)


* Using OrgBook to look up the correct name for a potential supplier or partner. (Source: https://orgbook.gov.bc.ca/en/home)


![Image of TheOrgBook Startup Page](https://www.hyperledger.org/wp-content/uploads/2019/02/lululemon-screenshot.png)





















