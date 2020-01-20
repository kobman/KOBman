
# QuickStart - automated setup script of KochiOrgBook (KOB)

click on the cog wheel for reviewing the automation code
<tr><th><a href="https://github.com/EtricKombat/KOBDevOps/blob/master/KOB"><img src="https://github.com/EtricKombat/KOBDevOps/blob/master/docs/assets/processing-automation.gif" width="200"/></a></th></tr>



## Cloning KOB automated Script into your local system using git , preferably use VirtualBox as Hypervisior

**Step 1:** Fork the repo https://github.com/EtricKombat/KOBDevOps.git into your namespace

**Step 2:** Clone the repo https://github.com/_yournamespace_/KOBDevOps.git into your local machine

**Step 3:** Run the KOB shell script as listed below and <a href="https://github.com/EtricKombat/KOBDevOps/issues">report back to us</a> if you want to post a question on the code.


* Use 64 bit  

**Command:**

        git clone https://github.com/EtricKombat/KOBDevOps.git

## Once KOBDevOps repo is downloaded into you local system 


### How to use the scripts 
Run the following commands on the terminal. 

         KOB install              // install default projects i.e KOBVON, KOBDflow,KOBConnect, KOBRegistry, TheKochOrgBook
         KOB install KOBVON       // Deploy KOBVON for testing
         KOB install --dev All    // install all the dev environment to do development
         KOB install --dev KOBVON // to install just the KOBVON project for development
 
         KOB install --dev KOBVON 
         KOB install --dev KOB      
         KOB install --dev TOB –namespace http://github/hyperledgerkochi


## For those who are new to git tool refer the steps mentioned below 
**(if you are familiar with git tool skip below listed section )**

<table>
<tr><th>Git installation - youtube</th><th>KOB Git Commands</th></tr>
<tr><td><a href="https://www.youtube.com/watch?v=ZMgLZUYd8Cw"><img src="https://github.com/EtricKombat/KOBDevOps/blob/master/docs/assets/git.gif" width="150"/></a></td><td><a href="https://asciinema.org/a/c7kyhrbH0UTdLp5kIQt4019F7"><img src="https://asciinema.org/a/c7kyhrbH0UTdLp5kIQt4019F7.png" width="150"/></a></td></tr>
</table>


<table>
 <tr><th>Commands : </th></tr>
 <tr><td>apt install git -y</td></tr>
 <tr><td>git --version</td></tr>
 <tr><td>git config --global user.name "username"</td></tr>
 <tr><td>git config --global user.email "email"</td></tr>
 <tr><td>git config --global http.sslVerify false</td></tr>
 <tr><td>apt install ca-certificates</td></tr>
 <tr><td>git config --system http.sslcainfo /bin/curl-ca-bundle.crt</td></tr>
</table>
<table>
 <tr><th>If behind proxy server- run the below listed config commands </th></tr>
 <tr><td>git config --global http.proxy http://username:password@domain.name.com:port</td></tr>
 <tr><td>git config --global https.proxy http://username:password@domain.name.com:port</td></tr>
  </table>






