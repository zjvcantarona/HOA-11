FROM ubuntu
MAINTAINER cantarona <cantarona@tip.edu.ph>

# Skip prompts
ARG DEBIAN_FRONTEND=noninteractive

# Update packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install apache2 -y
RUN apt-get install php libapache2-mod-php -y
RUN apt-get install mariadb-server mariadb-client -y
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN /etc/init.d/apache2 start

# Set entrypoint
ENTRYPOINT apache2ctl -D FOREGROUND1~
