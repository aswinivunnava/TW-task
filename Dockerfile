# Use centos/httpd-24-centos7 as base image
FROM centos/httpd-24-centos7:latest

USER root

# Install necessary packages for MediaWiki
RUN yum install -y centos-release-scl && \
    yum install -y wget httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml mariadb-server mariadb && \
    yum clean all

# Set up httpd24 and php73 root directories
ENV HTTPD_ROOT=/opt/rh/httpd24/root/var/www/html
ENV PHP_ROOT=/opt/rh/rh-php73/root

# Create directories for web content
RUN mkdir -p $HTTPD_ROOT && \
    mkdir -p /home/username

# Copy default SSL certificates into the container
COPY localhost.crt /etc/httpd/tls/
COPY localhost.key /etc/httpd/tls/

# Expose port 80
EXPOSE 80

WORKDIR /home/username

RUN wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz 

RUN cd /var/www && \
    tar -zxf /home/username/mediawiki-1.41.1.tar.gz && \
    ln -s mediawiki-1.41.1/ mediawiki

RUN chown -R apache:apache /var/www/mediawiki-1.41.1


CMD ["scl", "enable", "httpd24", "rh-php73" , "httpd", "-D", "FOREGROUND"]
