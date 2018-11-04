# TestContainer-hackathon
Hackathon reference tools, examples and setup instructions

TestContainer reference tools and examples are designed as kind of reference material. Setup is based on several docker-compose bundles. Providing large set of well known devops test tools with ready made integrations to demo data sources.
Due to large size of VM material only docker-compose will be shared via github. VM will be shared separately at the beginning of the session:

Requirements:
- [docker](https://docs.docker.com/glossary/?term=installation)
- [docker-compose](https://docs.docker.com/compose/install/)

For Win7 users. )
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Ready made VM-clone image will be available.

Example containers with open source codes: 
- nodejs-docker-sample-webapp: nodejs web app demo, based on [nodejs express] (https://expressjs.com/) 
- python-docker-sample-webapp: python web app demo
- spring-boot-sample: spring boot web app demo
- go-sample: go-lang web app demo   

Tools all in containers: 

Logging management: Stack fulfills a need in the log analytics space.
- EFK (Elasticseach,Fluentd,Kipana) with integration demo to httpd server. 
https://docs.fluentd.org/v0.12/articles/docker-logging-efk-compose
- ELK (Elasticseach,Logstash,Kipana) with syslog demo integration via logspout collector
 https://logz.io/learn/complete-guide-elk-stack/. Syslog conf description: https://jujucharms.com/u/lazypower/logspout/

Container management:
- Portainer, web UI that allows you to easily manage your Docker containers, images, networks and volumes > http://localhost:9000
https://portainer.readthedocs.io/en/stable/


Test Frameworks:

- Robot framework with Selenium:
Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). This docker is used to do web automation test with Firefox, [Selenium](http://www.seleniumhq.org/) and [Robot Framework](http://robotframework.org/). It complete the [Robot Framework test demo](https://bitbucket.org/robotframework/webdemo) with docker

TestCafe (Firefox edition):
A Node.js tool to automate end-to-end web testing. Write tests in JS or TypeScript, run them and view results. [Demo]( http://devexpress.github.io/testcafe/documentation/using-testcafe/using-testcafe-docker-image)

Jenkins:
The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project. 

Instruction:
- clone this project as zip file and extract it or use git clone command
- extract the "hackstack.zip" file in $HOME folder





