#Base Image
FROM	centos:7 
#Package installation and configuration changes
RUN	yum install httpd -y && \
	yum clean all && \
	echo "hello Apache Web Server Running in Container" > /var/www/html/index.html && \ 
	sed -i -e "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
#TCP Port expose
EXPOSE	8080 
#Directory access to user
WORKDIR	/
#Execute process at container layer 
CMD	/usr/sbin/httpd -DFOREGROUND
