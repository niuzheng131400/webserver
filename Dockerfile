FROM php:8.0.0-fpm

LABEL maintainer="youer" \
      website="https://niuzheng.net" \
      postbox="771036148@qq.com" \
      version="1.0" \
      description="The image is based on the integration environment of nginx, php, mysql and redis."


# step1
# If downloading scripts using a github connection is slow or times out, you can download scripts to 'install' in the current directory, comment out step 1 and open step 2.
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# step2
# COPY ./install/install-php-extensions /usr/local/bin/

RUN sed -i "s#http://deb.debian.org#http://mirrors.aliyun.com#g" /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/local/bin/install-php-extensions && \
    apt-get update && \
    apt-get install -y cron curl telnet inetutils-ping git zlib1g-dev nginx supervisor  libzip-dev unzip procps sudo vim rsyslog && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
    apt-get clean && rm -rf /var/cache/apt/* && \
    install-php-extensions gd xdebug zip pdo_mysql opcache mysqli bcmath redis mongodb swoole @composer && \
    unlink /etc/nginx/sites-enabled/default && \
    /bin/cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    /bin/cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf && \
    sed -i "s#include=NONE/etc/php-fpm.d#include=/usr/local/etc/php-fpm.d#g" /usr/local/etc/php-fpm.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]