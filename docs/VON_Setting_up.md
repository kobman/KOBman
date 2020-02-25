# VON

The Definition [VON](https://github.com/bcgov/von) is a verifiable organization's network that allows a group of trusted organizations combined together forms a network for the use of people and services across Cochin. The network can reduce the effort for people to reach an association to get authorized from that association or a community by making it online with blockchain technology which made the network more secure and to maintain privacy.

## Objectives

The overall goal of the project is to provide a secure platform where organizations/associations share their data which is needed for a new people or a community to enter in the association/society by verifying their credentials which is proof of concept without losing privacy of the organizations and associations 

## Why Blockchain?

von is built on a foundation of [blockchain](https://en.wikipedia.org/wiki/Blockchain) technology, and more specifically [hyperledger](https://en.wikipedia.org/wiki/Hyperledger)-indy. Blockchain technology focused on decentralized identity [DIDs]. Blockchain provides the data secure by directly storing the data in the network which is sovrin network, only authorized people can view the data in the network but no one has access to write the data on their own. you can refer the [link](https://vonx.io/getting_started/vons-blockchain-basis/) to get more details about Von's blockchain.

## Types of VON participants

The following people/ organizations that can be the part of the von-network
 - Authoritative Public Registries
    
    Authoritative public registries are the foundation of VON. Registries have the authority to register individuals and organizations to operate within a jurisdiction. There are many examples of registries:
    - Corporate registries for organizational entities (corporations, partnerships, sole 
    - proprietorships, non-profits and so on)
    - Professional accreditation registries (lawyers, doctors, engineers and so on)
    - Associations such as colleges and universities
    - Land title registries

- Permits and Licenses Issuers
    The organizations which can provide licenses/ permits to public entities that are authorized by a registry can enter into the network.
- Registration, Permit and Licence Verifiers

You can refer to the page [https://vonx.io/](https://vonx.io/) which is the official von site.

## VON Quick Guide

The VON Quick Start Guide provides the instructions for running a local instance of the VON applications, including an Indy Network, an instance of TheOrgBook and GreenLight. This is a great way to see the VON Network in action.
Running the Network Locally

## Running the Network Locally

1. First, install KOBMAN. Once it is installed, run the following command in the terminal window to install von-network 
```bash
kob install --dev tobvon
```
this command will automatically install the needed pre-requesters and software’s needed. 

2. Once the setup is completed, please check the von-network folder is exists in your local system in the following directory path 

```bash
user/home/von-network.
```

3. After that move to the directory where von is locally installed here the directory is “user/home/von-network” using terminal commands a follows:

```bash
cd von-network
```

4. Build the docker images that will be used to run the Indy network containers (this process will take several minutes):

```bash
./manage build
```

The `./manage` script has a number of commands. Run it without arguments to see the set of options.

5. Once the build process completes, you can test the build to make sure everything works properly:

```bash
./manage start
```

Monitor the logs for error messages as the nodes startup.

6. Verify the network is running

In a browser, go to [http://localhost:9000](http://localhost:9000). You should see the VON Indy Ledger Browser and the status of the four nodes of the Indy Network. All should show a lovely, complete blue circle. If not - check the logs in the terminal.

7. Stopping the Network

To stop the scrolling logs and get to a command prompt, hit **Ctrl-C**.  To stop and remove the network persistence (the Ledger), run:

```bash
./manage down
```

If necessary, you can use `stop` instead of `down` to stop the containers but retain the persistence.
