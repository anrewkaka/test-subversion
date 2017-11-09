FROM debian:stretch

#install subversion
RUN mkdir -p /home/svn \
	&& apt-get update \
	&& apt-get install -y subversion \
	curl \
	nano \
	sudo \
	apache2 \
	libapache2-svn

RUN mkdir /opt/svn && chmod -R 777 /opt/svn
RUN mkdir /opt/svn-auth && chmod -R 777 /opt/svn-auth

#RUN sudo /etc/init.d/apache2 start
CMD apachectl -D FOREGROUND
