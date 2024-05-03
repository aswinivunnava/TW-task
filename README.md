
# TW-task
## Task to configure MediaWiki on RHEL . 
you can find more information about the procedure in https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Red_Hat_Linux

# Using a LAMP Stack 
## Install operating system packages 
* Includes php and httpd releated packages
* configuring httpd apache, for that written a Dockerfile with base image centos/httpd-24-centos7:latest (taken from softwre collection)
* The build image is hosted on the public docker hub at 'aswinivunnava/thoughtwork-httpd'
* If want to build and run image locally, you will need to  generate SSL files which is required to copy to docker image
* **aswinivunnava/thoughtwork-httpd** configured for httpd in values.yml file
* From Software collection php image edited in values.yaml file: docker-registry.wikimedia.org/dev/buster-php81-fpm:1.0.1-s2 (taken from softwre collection)

## MySql Configuration
* Edited a db.sql file to set USER , DATABASE etc
* Build a Docker image **aswinivunnava/tw-sql** using a Dockerfile-sql which configures MySql with base image registry.access.redhat.com/rhscl/mariadb-102-rhel7 (taken from softwre collection)
* Also modified corresponding values in values.yaml file

## Autostart webserver and database daemons
* Autostarting these demons in Dockerfile

## Webserver (Apache) post-install configuration

* set these changes in files/httpd/httpd.conf in helm chart
  
  
# Installing the Chart
  To install the chart with the release name my-release:
                
                  `helm install --name my-release TW-task`

# CD pipeline to automate deployment in pipeline.yml 
Written only for dev environment . can configure multi stage also 
