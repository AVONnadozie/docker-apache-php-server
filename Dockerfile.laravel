FROM avonnadozie/apache-php-server

## Install required packages
RUN apt-get update && apt-get install -y \
    sudo \
    sendmail \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++ \
    && rm -rf /var/lib/apt/lists/*

## Install required extensions
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync
RUN install-php-extensions \
    gd \
    bz2 \
    intl \
    bcmath \
    opcache \
    calendar \
    pdo_mysql \
    zip

ENV WEBROOT_PUBLIC=/var/www/public
