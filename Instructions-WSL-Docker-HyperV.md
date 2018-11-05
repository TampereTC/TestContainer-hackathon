# HACKATHON Setup for WINDOWS 10: WSL + Docker

Instructions how to install Docker for Windows and integrating the same to “Bash on Ubuntu on Windows”.

Why WSL? 
- Natively docker configuration is based on linux file system. -> Ensure linux compatibility to run docker commands on bash shell.
- Hyper-V natively integrated as part of Windows10 OS. -> Ensure Optimal performance to run VMs
- WSL is well integrated as past of Windows OS -> E.g less work with adaptations. E.g Win volume mounts by default in place

![VSL Solution](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/WSL-architecture.png)

## Configure Windows 10 system settings: 

Enable Hyper-V and WSL (Windows Subsystem for Linux) 

- Control Panel\Programs -> Windows Features on / off

![Winfeat on off](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/win-feat-on.png)

- Select following features - On.

![Winfeatures](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/win-feat-on2.png)

## Install Ubuntu Shell via Microsoft store

![Store](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/store.png)

## Install Docker for Windows. 

[Download link](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

## Configure Docker: 

Expose the Docker daemon (start Docker or set to “Start Docker automatically when you login into your PC)

![expose](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/docker-win.png)

Add Shared folders from host to docker VM

![Volumes](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/Volumes.PNG)

Reserve at least 4GB RAM and 3-4 CPU cores

![CPU](https://github.com/TampereTC/TestContainer-hackathon/blob/master/WSL/CPU-mem.PNG)

## Install Docker CLI and Docker-Compose for WSL 

Launch WSL (Named as Ubuntu)

Environment variables you need to set so you don't have to edit the script below.

$`export DOCKER_CHANNEL=edge`

$`export DOCKER_COMPOSE_VERSION=1.23.1`

Update the apt package index.

$`sudo apt-get update`

Install packages to allow apt to use a repository over HTTPS.

$`sudo apt-get install -y 
    apt-transport-https 
    ca-certificates 
    curl 
    software-properties-common`

Add Docker's official GPG key.

$`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

Verify the fingerprint.

$`sudo apt-key fingerprint 0EBFCD88`

Pick the release channel.

$`sudo add-apt-repository 
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu 
   $(lsb_release -cs) 
   ${DOCKER_CHANNEL}"`

Allow your user to access the Docker CLI without needing root.

$`sudo usermod -aG docker $USER`

Install Docker Compose.

$``sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose``

6)	You need to tell the Docker client (running in WSL) where the Docker host is (on Windows side), and you can do that by using the -H option as follows:

$`docker -H localhost:2375 images`

$`export DOCKER_HOST=localhost:2375`

If you want to get cute, you could do all of that with this 1 liner:

$`echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc`

Check that all looks ok

$`docker info`

check the WSL mount to host system
Your windows home is typically mounted under c or d drive. /mnt/c/Users/<user>
Extract your hackathon material here /mnt/c/Users/<user>/hackstack

$`cd /mnt/c/Users/<user>/hackstack`

Win10 WSL Subsystem is ready to follow further instruction. 
Note that 'sudo' is not working with WSL docker. 
Please run further commands without sudo.

