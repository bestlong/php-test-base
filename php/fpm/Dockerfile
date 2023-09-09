ARG _PHP_VERSION
FROM php:${_PHP_VERSION}-fpm

RUN set -eux; \
    apt-get update; \
    apt-get install -yqq git \
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
        ;

RUN set -eux \
  ### mbstring
  # &&  docker-php-ext-install mbstring; \
  # &&  php -m | grep -oiE '^mbstring$' \
  ### mcrypt
  &&  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        docker-php-ext-install mcrypt; \
      fi \
  # &&  php -m | grep -oiE '^mcrypt$' \
  ### zip
  &&  apt-get install -yqq libzip-dev zip unzip \
  &&  docker-php-ext-install zip \
  &&  php -m | grep -oiE '^zip$' \
  ### xdebug
  &&  docker-php-ext-install \
        pdo_mysql pdo_pgsql curl json intl gd xml bz2 opcache \
        xsl

RUN set -eux \
  ### redis
  &&  pecl install redis \
  &&  docker-php-ext-enable redis \
  &&  php -m | grep -oiE '^redis$' \
  ### xdebug
  &&  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        pecl install xdebug-2.5.5; \
      elif [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70200" ] \
        || [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70400" ]; then \
        pecl install xdebug-3.1.6; \
      else \
        pecl install xdebug; \
      fi \
  &&  docker-php-ext-enable xdebug \
  &&  php -m | grep -oiE '^xdebug$'
