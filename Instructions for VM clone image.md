# HACKATHON Setup for WINDOWS 7 + Docker in Virtualbox

Instructions to setup ready made hackathon env by Virtualbox based VM clone image.  

Why Docker in Virtualbox? 
- No Docker support in Windows 7.
- Ready made VM with full hackathon setup in one package save your time.

Other side of the coin:
- From docker performance point of view. Docker VM inside of Virtualbox VM is not ideal solution.
- Mounting volumes via office OS host will be tricky. 

## Configuration:

Instructions are covering Virtualbox installation + VM clone image related settings.

![VSL Solution](https://github.com/TampereTC/TestContainer-hackathon/blob/master/VM/Picture1.png)

## Instructions:


**Requirements:**
- 64 bits Virtualization (requires IT support to access bios) 
- Virtualbox: [Download link](https://www.virtualbox.org/wiki/Downloads)
- Disk space: Totally 50 GB disk space is needed in your targer file system

VM Clone image will be shared separately. Note: Not via Github.

**Virtual Machine clone image**

- Location: Source folder \hachathon\VM
- Copy all files to the temp location where you have enough disk space
- Extract files by Winzip or 7-zip by clicking to your selected folder.

**VM image configuration in Virtualbox**

Attach VM image in Virtualbox
- Start Virtualbox -> Click "New" icon
- Attach VM as described below. Reserve 4GM RAM and at least 3 CPU cores.

![AttachVM](https://github.com/TampereTC/TestContainer-hackathon/blob/master/VM/VirtualBox%20link%20VM%20image.PNG)
![CPU MEM](https://github.com/TampereTC/TestContainer-hackathon/blob/master/VM/VM%20cpu.png)

**Start "hackstack" VM in Virtualbox**

- Click start button
- No password required. However sudo requires it. -> \hackathon\VM\VM clone guide


**Check installation**

- Open terminal and locate to the $HOME/hackstack folder.
- Run command: sudo docker-compose -f docker-compose-portainer.yml up -d
- Open Firefox browser: http://localhost:9000 admin:!hackhack

Your setup should looks like follows: 
VM package is ready to follow hackathon instructions to [startup containers.](https://github.com/TampereTC/TestContainer-hackathon/blob/master/README.md#startup-containers) 

![Screenshot](https://github.com/TampereTC/TestContainer-hackathon/blob/master/VM/Screenshot%20hackstack%20dashboard.png)


