FROM debian:stretch

# add some text

RUN mkdir /home/Nginx \
    && cd /home/Nginx \
    && apt-get update \
    && apt-get -y install wget \
    curl \
    gnupg \
    gnupg1 \
    gnupg2

#Download the Nginx repository signing key
RUN wget http://nginx.org/keys/nginx_signing.key

#Add the Nginx signing key to a system
RUN apt-key add nginx_signing.key

#Append Nginx repository to /etc/apt/sources.list file
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | tee -a /etc/apt/sources.list

#Install Nginx package using the following command
RUN apt-get update; apt-get -y install nginx

EXPOSE 80

#Start the Nginx service after the installation
#RUN systemd start nginx.service
CMD ["nginx", "-g", "daemon off;"]
