ARG _PHP_VERSION
FROM php:${_PHP_VERSION}

RUN apt-get update \
  && apt-get install -yqq git \
        libmcrypt-dev \
        libpq-dev \
        libcurl4-gnutls-dev \
        libicu-dev \
        libvpx-dev \
        libjpeg-dev \
        libpng-dev \
        libxpm-dev \
        zlib1g-dev \
        libfreetype6-dev \
        libxml2-dev \
        libexpat1-dev \
        libbz2-dev \
        libgmp3-dev \
        libldap2-dev \
        unixodbc-dev \
        libsqlite3-dev \
        libaspell-dev \
        libsnmp-dev \
        libpcre3-dev \
        libtidy-dev \
        libxslt-dev \
        # mysql-client \
        mariadb-client \
  && docker-php-ext-install mbstring \
        # mcrypt \
        pdo_mysql pdo_pgsql curl json intl gd xml zip bz2 opcache \
        xsl

RUN set -eux; \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl install xdebug-2.5.5; \
    else \
      pecl install xdebug; \
    fi; \
    docker-php-ext-enable xdebug

RUN apt-get install -yq

RUN php -m && php --ini
