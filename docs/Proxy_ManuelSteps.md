## Proxy Steps
* You should follow these steps if you are facing issue while proceeding with the <a href="https://github.com/EtricKombat/KOBDevOps/blob/master/docs/02_ManuelSteps.md">manuel steps</a>

<table>
<tr><th>No: </th><th>Commands</th></tr>
<tr><th>1.0</th><th>If behind proxy server- add below listed proxy config to /etc/apt/apt.conf </th></tr>
<tr><td>1.1</td><td>Acquire::http::proxy "http://username:password@domain.name.com:port/";</td></tr>
<tr><td>1.2</td><td>Acquire::ftp::proxy "ftp://username:password@domain.name.com:port/";</td></tr>
<tr><td>1.3</td><td>Acquire::https::proxy "https://username:password@domain.name.com:port/";</td></tr>
<tr><td>1.4</td><td>Acquire::socks::proxy "socks://username:password@domain.name.com:port/";</td></tr>
<tr><th>2.0</th><th>Exporting Proxy Env variable</th></tr>
<tr><td>2.1</td><td>export http_proxy=http://username:password@domain.name.com:port/</td></tr>
<tr><td>2.2</td><td>export https_proxy=http://username:password@domain.name.com:port/</td></tr>
<tr><td>2.3</td><td>export ftp_proxy=ftp://username:password@domain.name.com:port/</td></tr>
<tr><td>2.4</td><td>export socks_proxy=socks://username:password@domain.name.com:port/</td></tr>
 <tr><th>3.0</th><th>For git, behind proxy server- run the below listed config commands </th></tr>
 <tr><td>3.1</td><td>git config --global http.proxy http://username:password@domain.name.com:port</td></tr>
 <tr><td>3.2</td><td>git config --global https.proxy http://username:password@domain.name.com:port</td></tr>
<tr><th>4.0</th><th>Docker behind proxy </th></tr>
<tr><td>4.1</td><td>mkdir -p /etc/systemd/system/docker.service.d/</td></tr>
<tr><td>4.2</td><td>touch /etc/systemd/system/docker.service.d/https-proxy.conf</td></tr>
<tr><td>4.3</td><td>echo -e "[Service]\nEnvironment="HTTPS_PROXY=http://username:password@domain.name.com:port"">>/etc/systemd/system/docker.service.d/https-proxy.conf </td></tr>
<tr><td>4.4</td><td>rm -rf /root/.docker/config.json</td></tr>
<tr><td>4.5</td><td>docker login</td></tr>
<tr><td>4.6</td><td>sed -i '$ d' /root/.docker/config.json</td></tr>
<tr><td>4.7</td><td>echo -e ",\n "\""proxies"\"": {\n\t "\""default"\"": {\n\t\t "\""httpProxy"\"": "\""http://username:password@domain.name.com:port"\"",\n\t\t "\""httpsProxy"\"": "\""https://username:password@domain.name.com:port"\"",\n\t\t "\""noProxy"\"": "\""localhost,127.0.0.0/8,*.local,host.docker.internal"\"" \n\t\t}\n\t}\n}">>/root/.docker/config.json
</td></tr>
<tr><th>5.0</th><th>NPM - Proxy Commands : </th></tr>
<tr><td>5.1</td><td>npm config set https-proxy http://${uname}:${pword}@${prox}:${port}--global</td></tr>
<tr><td>5.2</td><td>npm config set https-proxy http://${uname}:${pword}@${prox}:${port}</td></tr>
<tr><td>5.3</td><td>npm config set proxy http://${uname}:${pword}@${prox}:${port}--global</td></tr>
<tr><td>5.4</td><td>npm config set proxy http://${uname}:${pword}@${prox}:${port}</td></tr>

</table>


