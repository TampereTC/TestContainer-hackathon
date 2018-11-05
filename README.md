# TestContainer-hackathon
Hackathon reference tools, examples and setup instructions

TestContainer reference tools and examples are designed as kind of reference material. Setup is based on several docker-compose bundles. Providing large set of well known devops test tools with ready made integrations to demo data sources. 

*Requirements:*

Windows10 or linux users could easily setup hackathon environment by using github material as such. For Win7 users. Docker is not supported in your OS. However therefore hackathon environment can be setup via dedicated VM clone image. Due to large size of VM material only docker bundles are available via github. The hackathon VM will be distributed separately at the beginning of the event and it contains whole set of required docker tools and containers in one package:

For Win10 & Linux users:

- [docker windows](https://docs.docker.com/docker-for-windows/install/)
- [docker ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [docker-compose](https://docs.docker.com/compose/install/)

For Win7 users: 

Virtualbox is one option and reference VM clone image for Hackathon is based on it.

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)


Please reserve at least 30GB free disk space for hackathon VM installation.


**Demo apps:**

Example containers with open source codes: 
- nodejs-docker-sample-webapp: nodejs web app demo, based on [nodejs express](https://expressjs.com/) 
- python-docker-sample-webapp: python web app demo
- spring-boot-sample: spring boot web app demo
- go-sample: go-lang web app demo   




**Tools:**

All of the tools are in containers as well 

***Logging management:*** 

Stack of devops tools fulfills a need in the log analytics space.

- EFK [(Elasticseach,Fluentd,Kipana)](https://docs.fluentd.org/v0.12/articles/docker-logging-efk-compose) with integration demo to httpd server. 

- ELK [(Elasticseach,Logstash,Kipana)](https://logz.io/learn/complete-guide-elk-stack/) with syslog demo integration via logspout collector. [Syslog conf description:](https://jujucharms.com/u/lazypower/logspout/)

FYI: [Fluentd vs. Logstash: A Comparison of Log Collectors](https://logz.io/blog/fluentd-logstash/)

***Container dashboard:***
- [Portainer](https://portainer.readthedocs.io/en/stable/), web UI that allows you to easily manage your Docker containers, images, networks and volumes. Dashboard UI in your sandbox setup. http://localhost:9000




**Test Frameworks:**

***Robot framework with Selenium:***
- Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). This docker is used to do web automation test with Firefox, [Selenium](http://www.seleniumhq.org/) and [Robot Framework](http://robotframework.org/). It complete the [Robot Framework test demo](https://bitbucket.org/robotframework/webdemo) with docker

***TestCafe (Firefox edition):***
- A Node.js tool to automate end-to-end web testing. Write tests in JS or TypeScript, run them and view results. [Demo]( http://devexpress.github.io/testcafe/documentation/using-testcafe/using-testcafe-docker-image)

***Jenkins in docker:***
- The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project. 



**Instruction:**
- clone this project as zip file and extract it or use git clone command
- extract the 'hackstack*' files in $HOME folder

***Unzip the files***

Due to large size, the zip files has split to 6 parts. Here the linux command to unzip the file.

`zip -s 0 hackstack.zip --out unhackstack.zip`

$`unzip unhackstack.zip`


***Portainer dashboard:***
- login to your home folder
- start up command:

`cd hackstack`

`sudo docker-compose -f docker-compose-portainer.yml up -d`

- shutdown command:

`sudo docker-compose -f docker-compose-portainer.yml down`

***Demo applications bundle with test frameworks without logging features:***
- login to your home folder
- start up command:

`cd hackstack`

`sudo docker-compose up -d`

- shutdown command:

`sudo docker-compose down`

***Demo applications bundle with test frameworks with EFK logging features:***
- login to your home folder
- start up command:

`cd hackstack`

`sudo docker-compose -f docker-compose-efk.yml up -d`

- shutdown command:

`sudo docker-compose -f docker-compose-efk.yml down`

***Demo applications bundle with test frameworks with ELK logging features:***
- login to your home folder
- start up command:

`cd hackstack`

`sudo docker-compose -f docker-compose-elk.yml up -d`

- shutdown command:

`sudo docker-compose -f docker-compose-elk.yml down`

***Rebuild containers by compose:***

In case you have made changes for local Dockerfile or itself content then rebuild the bundle.
(Changes in docker-compose yml file does not require rebuilding, only restart is needed)
Also there are some conf files mounted to host folders. In order to changes into use only container restart is needed. 

`sudo docker-compose -f <docker-compose file> build`
  
  
  
**Kubernetes configuration:**
- It is doable to use convert docker-compose yml files to Kubernetes format by [Kompose tool:](http://kompose.io/) however configuring volume mounting seems to be a bit tricky and requires extra work to do. Roughly 70% of containers were succesfully converted to Kubernetes PODs yaml format.



**Good to know:**
- Note that each of the compose files contains instructions.
- Some of the containers are mounted to your host. 
volumes: <host>:<container>. ->  "./<path>" means your "hackstack" folder 
- Reserve enough memory (4GB) and cpu cores (3-4) to your VM setup
