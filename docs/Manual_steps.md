## Pre-requisites
* OS should be Ubuntu 18.04
* minimum of 4GB RAM require for Virtual Machine


### QuickStart Guide:
* Use 64 bit <a href="https://ubuntu.com/download/desktop/thank-you?version=18.04.3&architecture=amd64">Ubuntu 18.04 ISO</a> Distribution 
* Use <a href="https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0.14-133895-Win.exe">VirtualBox </a> as Hypervisor .

This steps should perform on an 64 bit machine.



<table>

<tr><th>No:</th><th>Commands : </th></tr>
<tr><th>1.0:</th><th>Ubuntu installation - Command</th></tr>
<tr><td>1.1</td><td>apt-get update -y</td></tr>
<tr><td>1.2</td><td>apt-get dist-upgrade -y</td></tr>
<tr><th>2.0:</th><th>Git installation - Command</th></tr>
<tr><td>2.1</td><td>apt install git -y</td></tr>
 <tr><td>2.2</td><td>git --version</td></tr>
 <tr><td>2.3</td><td>git config --global user.name "username"</td></tr>
 <tr><td>2.4</td><td>git config --global user.email "email"</td></tr>\
 <tr><td>2.5</td><td>git config --global http.sslVerify false</td></tr>
 <tr><td>2.6</td><td>apt install ca-certificates</td></tr>
 <tr><td>2.7</td><td>git config --system http.sslcainfo /bin/curl-ca-bundle.crt</td></tr>
<tr><th>3.0:</th><th>Python installation - Commands</th></tr>
<tr><td>3.1</td><td>apt install software-properties-common -y</td></tr>
 <tr><td>3.2</td><td>sudo -E add-apt-repository ppa:ubuntu-toolchain-r/ppa</td></tr>
<tr><td>3.3</td><td>apt install Python3.7 -y</td></tr>
<tr><th>4.0:</th><th>Docker installation - Commands</th></tr>
<tr><td>4.1</td><td>sudo apt-get remove docker docker-engine docker-ce docker-ce-cli docker.io</td></tr>
 <tr><td>4.2</td><td>apt-get update -y</td></tr>
 <tr><td>4.3</td><td>apt install docker.io</td></tr>
 <tr><td>4.4</td><td>apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y</td></tr>
 <tr><td>4.5</td><td>curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -</td></tr>
 <tr><td>4.6</td><td>apt-key fingerprint 0EBFCD88</td></tr>
 <tr><td>4.7</td><td>lsb_release -cs</td></tr>
 <tr><td>4.8</td><td>add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"</td<</tr>
 <tr><td>4.9</td><td>apt-get update -y</td></tr>
<tr><td>4.10</td><td>apt-get install docker-ce docker-ce-cli containerd.io -y</td></tr>
<tr><td>4.11</td><td>docker run hello-world</td></tr>
<tr><th>5.0:</th><th>Docker Compose installation - Commands</th></tr>
<tr><td>5.1</td><td>curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose</td></tr>
<tr><td>5.2</td><td>chmod +x /usr/local/bin/docker-compose</td></tr>
<tr><td>5.3</td><td>docker --version</td></tr>
<tr><td>5.4</td><td>docker-compose --version</td></tr>
<tr><td>5.5</td><td>systemctl start docker</td></tr>
<tr><td>5.6</td><td>systemctl enable docker</td></tr>
<tr><td>5.7</td><td>docker login</td></tr>
<tr><th>6.0:</th><th>NPM installation - Commands</th></tr>
<tr><td>6.1</td><td>npm config rm proxy</td></tr>
<tr><td>6.2</td><td>npm config rm proxy --global</td></tr>
<tr><td>6.3</td><td>npm config rm https-proxy</td></tr>
<tr><td>6.4</td><td>npm config rm https-proxy --global</td></tr>
<tr><td>6.5</td><td>npm config rm registry</td></tr>
<tr><td>6.6</td><td>npm cache clean</td></tr>
<tr><td>6.7</td><td>sudo apt-get remove nodejs nodejs-dev node-gyp libssl1.0-dev npm</td></tr>
<tr><td>6.8</td><td>sudo apt-get install nodejs nodejs-dev node-gyp libssl1.0-dev npm</td></tr>
<tr><td>6.9</td><td>npm config set registry http://registry.npmjs.org</td></tr>
<tr><td>6.10</td><td>npm config set strict-ssl false</td></tr>
<tr><th>7.0:</th><th>VON Network installation - Commands</th></tr>
<tr><td>7.1</td><td>apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev</td></tr>
<tr><td>7.2</td><td>mkdir -p /home/KOB</td></tr>
<tr><td>7.3</td><td>cd /home/KOB</td></tr>
<tr><td>7.4</td><td>git clone https://github.com/hyperledgerkochi/von-network.git</td></tr>
<tr><td>7.5</td><td>/home/KOB/von-network/manage rm</td></tr>
<tr><td>7.6</td><td>/home/KOB/von-network/manage build</td></tr>
<tr><td>7.7</td><td>/home/KOB/von-network/manage start</td></tr>
<tr><th>8.0:</th><th>TheOrgBook installation - Commands</th></tr>
<tr><td>8.1</td><td>apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev npm</td></tr>
<tr><td>8.2</td><td>mkdir -p /home/KOB</td></tr>
<tr><td>8.3</td><td>cd /home/KOB</td></tr>
<tr><td>8.4</td><td>git clone https://github.com/hyperledgerkochi/TheOrgBook.git</td></tr>
<tr><td>8.5</td><td>wget https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz</td></tr>
<tr><td>8.6</td><td>tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz</td></tr>
<tr><td>8.7</td><td>mv s2i sti /usr/local/bin/</td></tr>
<tr><td>8.8</td><td>/home/KOB/TheOrgBook/docker/manage rm </td></tr>
<tr><td>8.9</td><td>/home/KOB/TheOrgBook/docker/manage build</td></tr>
<tr><td>8.10</td><td>/home/KOB/TheOrgBook/docker/manage start seed=the_org_book_0000000000000000000</td></tr>
<tr><th>9.0:</th><th>greenlight installation - Commands</th></tr>
<tr><td>9.1</td><td>apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev npm</td></tr>
<tr><td>9.2</td><td>mkdir -p /home/KOB</td></tr>
<tr><td>9.3</td><td>cd /home/KOB</td></tr>
<tr><td>9.4</td><td>git clone https://github.com/hyperledgerkochi/greenlight.git	</td></tr>
<tr><td>9.5</td><td>wget https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz</td></tr>
<tr><td>9.6</td><td>tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz</td></tr>
<tr><td>9.7</td><td>mv s2i sti /usr/local/bin/</td></tr>
<tr><td>9.8</td><td>/home/KOB/greenlight/docker/manage rm </td></tr>
<tr><td>9.9</td><td>/home/KOB/greenlight/docker/manage build </td></tr>
<tr><td>9.10</td><td>/home/KOB/greenlight/docker/manage start</td></tr>
</table>
