# Documentation on setting up TheKochiOrgBook

# TheOrgBook

TheOrgBook is a Credential Registry of verifiable credentials about entities. A public instance of TheOrgBook, contains a verifiable credentials about organizations (incorporations, professionals, etc.) issued by trusted public services such as Corporate Registries, regulatory agencies, permitting services, licencing services, procurement services and the like.


![Image of TheOrgBook](https://raw.githubusercontent.com/bcgov/TheOrgBook/master/docs/assets/images/TheOrgBook-HighLevel2.png)


An OrgBook instance is an implementation of a verifiable credential registry, a “community digital wallet” holding verifiable credentials about entities registered in the operating jurisdiction. An OrgBook is used by [VON](https://vonx.io/getting_started/get-started/) issuer/verifier agents that request proofs of claims held by the OrgBook about entities and that issue verifiable credentials to the OrgBook instance.


Each OrgBook instance is operated by an [authoritative public registry](https://vonx.io/getting_started/get-started#authoritative-public-registries), and all the verifiable credentials held are linked to those registered entities. An OrgBook provides a website supporting users searching OrgBook from their browser for information about the registered entities. As well, an OrgBook instance provides the Application Programming Interface (API) necessary to support VON issuer/verifier agents integrations.

**Prerequisites**
-----------------

1.Von network should be setup.For more information regarding setting up Von network refer [here](https://github.com/TEJAlions/KOBman/blob/master/docs/von-network.md).


# Running an Instance of OrgBook

OrgBook is a moderately complex application to customize, deploy and run in production. There is good documentation (including operational deployment scripts) in the [OrgBook GitHub](https://github.com/bcgov/TheOrgBook) repo that drives the BC and Ontario instances. 

OrgBook’s search capabilities support the generic concepts of names, addresses (locations) and credential types - regardless of how those concepts are defined in Credentials.

# OrgBook Architecture

TheOrgBook which implements a microservices architecture approach and consists of multiple sub-components, each having a specific function and running as a separate Docker container.

**API** - tob-api directory in TheOrgBook’s repo - the API components implements RESTful endpoints for system-to-system communication - within TheOrgBook and with external applications. Only read-only endpoints are open for public use. The write endpoints require authentication. Implemented using Django 1.11 and Python 3.

**Web UI** - tob-web directory in TheOrgBook’s repo - built using Angular and uses templates to allow customizations to be applied to UI. The choice of templates and design elements is driven by the value of TOB_THEME environmental variable. Read more about our approach to theme development here and accessibility compliance here.

**Database**- tob-db directory in TheOrgBook’s repo - this is a searchable database implemented using PostgreSQL 10 and contains business information that is searchable via the web UI.

**Search Engine configiration** - tob-solr directory in TheOrgBook’s repo - TheOrgBook uses Solr search engine to deliver real time indexing for records in the database and the autocomplete capability. This sub-component contains a custom configuration for Solr.

**Enterprise Wallet** - tob-wallet directory in TheOrgBook’s repo - a configuration for Hyperledger Indy Enterprise wallet. The wallet component itself is included as a part of the von-image Docker image file.


Organizations looking to implement an OrgBook instance should review the pages in this guide for the following deployments of VON ecosystems.

**British Coloumbia** - [BC-OrgBook](https://vonx.io/getting_started/bc-architecture)

**Ontario** - [Ontario-OrgBook](https://vonx.io/getting_started/ontario-architecture)


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

* The next thing you'll need to do is **build the Docker images**. Since this requires a combination of Docker and S2I builds the process has been scripted inside *manage*.
```
./manage build

```
* To start the project run:
```
./manage start seed=my_unique_seed_00000000000000000

```
You will need to choose a unique seed value for development. Use a value that no one else is using. It must be 32 characters long exactly.

This will start the project interactively, with all of the logs being written to the command line.

Each seed must be authorized on the Indy ledger. If you are running the VON Network component locally, then DID registration is automatic. If using a shared Indy ledger then you will need to request authorization.

* There are two commands to stop the project run:
```
./manage stop

```
and

```
./manage down

```
**stop** merely stops the containers, but leaves the rest of the docker-compose structure in place - volumes (and the Indy wallets they store) and networking. 

**down** is destructive, removing the volumes and network elements. 


* After deployment, the OrgBook main UI will be running under the following port by default :
```
  https://localhost:8080/en/home

```






















