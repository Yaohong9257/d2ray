# Build it From Zero

## create vps
1.new vps on google cloud and get the public IP;

a firewall rule



## buy an domain
2.namesilo Manage DNS 

https://www.namesilo.com/account_domain_manage_dns.php

Select the resource record type you want to create: A

for example: vvv.trymediationg.top to  

3.install docker on google cloud vps




## install docker

Here's a step-by-step guide to installing Docker on a Debian GNU/Linux system:

1. Update your existing list of packages:
```bash
sudo apt-get update
```
2. Install a few prerequisite packages which let `apt` use packages over HTTPS:
```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
```
3. Add the GPG key for the official Docker repository to your system:
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
4. Add the Docker repository to APT sources:
```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
5. Update the package database with the Docker packages from the newly added repo:
```bash
sudo apt-get update
```
6. Make sure you are about to install from the Docker repo instead of the default Debian repo:
```bash
apt-cache policy docker-ce
```
You should see output similar to this:

    docker-ce:
      Installed: (none)
      Candidate: 5:20.10.6~3-0~debian-buster
      Version table:
         5:20.10.6~3-0~debian-buster 500
            500 https://download.docker.com/linux/debian buster/stable amd64 Packages

7. Finally, install Docker:
```bash
sudo apt-get install docker-ce
```
8. Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:
```bash
sudo systemctl status docker
```

After this, Docker should be installed and ready to use on your Debian system.



## add docker group


This error message is suggesting that your user does not have the right permissions to access the Docker daemon. To fix this, you need to add your user to the `docker` group.

Please follow these steps:

1. If you haven't already created the docker group, do it with this command:

    ```bash
    sudo groupadd docker
    ```

2. Add your user to the docker group:

    ```bash
    sudo usermod -aG docker $USER
    ```
   Replace `$USER` with your username if it doesn't work.

3. Log out and log back in so that your group membership is re-evaluated, or type the following command:

    ```bash
    newgrp docker 
    ```

4. Verify that you can run `docker` commands without `sudo`:

    ```bash
    docker run hello-world
    ```

After this, you should be able to run Docker commands without needing to use `sudo`.

If you still have problems, please make sure the Docker service is running by using this command:

```bash
sudo systemctl status docker
```


## download this project


git clone https://github.com/Yaohong9257/d2ray.git


## vim .env

generate uuid by run `uuidgen` on macos

```
PORT=32368
FQDN=vvv.example.com
USERS=UUID1,UUID2@xtls-rprx-vision,UUID3@xtls-rprx-direct
LOGDIR=./logs
```

## start docker contianer

run `docker compose up -d`





