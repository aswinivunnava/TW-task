
# TW-task
## Task to configure MediaWiki on RHEL https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Red_Hat_Linux

# Using a LAMP Stack 
## Install operating system packages 
* includes php and httpd releated packages
* configuring httpd apache written a Dockerfile with base image centos/httpd-24-centos7:latest (taken from softwre collection)
* build image is in public docker hub - aswinivunnava/thoughtwork-httpd
* If want to build and run image local required to generate SSL files which is required to copy to docker image
* **aswinivunnava/thoughtwork-httpd** configured for httpd in values.yml file
* From Software collection php image edited in values.yaml file: docker-registry.wikimedia.org/dev/buster-php81-fpm:1.0.1-s2
  
