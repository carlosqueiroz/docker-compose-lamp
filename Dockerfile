FROM centos:6
MAINTAINER Takayuki Miwa <i@tkyk.name>

ENV code_root /code
ENV httpd_conf ${code_root}/httpd.conf

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum install -y httpd nano curl php56-imap php5-curl php-gd  php56-common php-imap
RUN yum install --enablerepo=epel,remi-php56,remi -y \
                              php \
							  php-imap\
                              php-cli \
                              php-gd \
                              php-mbstring \
                              php-mcrypt \
                              php-mysqlnd \
                              php-pdo \
                              php-xml \
                              php-xdebug
RUN sed -i -e "s|^;date.timezone =.*$|date.timezone = America/Sao_Paulo|" /etc/php.ini
RUN sed -i -e "s|^;upload_max_filesize =.*$|upload_max_filesize = 200M|" /etc/php.ini

ADD . $code_root
RUN test -e $httpd_conf && echo "Include $httpd_conf" >> /etc/httpd/conf/httpd.conf

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

