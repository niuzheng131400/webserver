FROM php:7.4-fpm

MAINTAINER ZhengNiu "771036148@qq.com"

COPY ./install/install-php-extensions /usr/local/bin/

RUN sed -i "s#http://deb.debian.org#http://mirrors.aliyun.com#g" /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/local/bin/install-php-extensions && \
    apt-get update && \
    apt-get install -y cron curl telnet inetutils-ping git zlib1g-dev nginx supervisor  libzip-dev unzip procps sudo vim && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
    apt-get clean && rm -rf /var/cache/apt/* && \
    install-php-extensions gd xdebug zip pdo_mysql opcache mysqli bcmath redis mongodb swoole @composer && \
    unlink /etc/nginx/sites-enabled/default && \
    /bin/cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    sed -i "482c display_errors = On" /usr/local/etc/php/php.ini && \
    sed -i "503c log_errors = On" /usr/local/etc/php/php.ini && \
    sed -i "586c error_log = /var/log/php/php_errors.log" /usr/local/etc/php/php.ini && \
    sed -i "12c nodaemon=true" /etc/supervisor/supervisord.conf && \
    echo "[program:cron]\ncommand=cron -f\n\n[program:nginx]\ncommand=/usr/sbin/nginx -g 'daemon off;'\n\n[program:php]\ncommand=/usr/local/sbin/php-fpm --nodaemonize" > /etc/supervisor/conf.d/web.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["supervisord","-c","/etc/supervisor/supervisord.conf"]