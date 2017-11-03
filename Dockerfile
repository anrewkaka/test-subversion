FROM debian:stretch

RUN mkdir /home/Nginx

RUN cd /home/Nginx

#Install Nginx

#Download the Nginx repository signing key
RUN wget http://nginx.org/keys/nginx_signing.key

#Add the Nginx signing key to a system
RUN apt-key add nginx_signing.key

#Append Nginx repository to /etc/apt/sources.list file
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list

#Install Nginx package using the following command
RUN apt-get update; apt-get -y install nginx

#Start the Nginx service after the installation
RUN systemctl start nginx.service

EXPOSE 22
