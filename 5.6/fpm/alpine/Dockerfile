FROM php:5.6-fpm-alpine

# https://github.com/xlanger/docker/blob/master/php/5.6.30-fpm-alpine/Dockerfile

RUN set -ex \
 && apk add --no-cache --virtual .build-deps \
        autoconf \
        file \
        gcc \
        g++ \
        libc-dev \
        make \
        pkgconf \
        re2c \ 
        tzdata \
 && apk add --no-cache \
        git \
        libmcrypt-dev \
        postgresql-dev \
        curl-dev \
        icu-dev \
        libpng-dev \
        libxml2-dev \
        bzip2-dev \
 && docker-php-ext-install \
        mbstring mcrypt pdo_pgsql curl json intl gd xml zip bz2 opcache \
 && pecl install \
        xdebug \
 && docker-php-ext-enable \
        xdebug \
 && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
 && echo "Asia/Taipei" >  /etc/timezone \
 && apk del .build-deps
