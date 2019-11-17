FROM php:7.3-apache

# 1 Development packages
RUN apt-get update && apt-get install -y \
    git \
    zip \
    cron \
    unzip \
   && rm -rf /var/lib/apt/lists/*

# 2. start with base php config, then add extensions
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 4. composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 5. we need a user with the same UID/GID with host user
# so when we execute CLI commands, all the host file's ownership remains intact
# otherwise command from inside container will create root-owned files and directories

ENV UID=9000
RUN useradd -G www-data,root -u ${UID} -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer
RUN chown -R devuser:devuser /home/devuser

# 6. add start script.
ADD start.sh /start.sh
RUN chmod 755 /start.sh

# 7. set the work directory.
ENV WEBROOT=/var/www
ENV WEBROOT_PUBLIC=/var/www/html
WORKDIR /var/www

# 8. kickstart!
CMD ["/start.sh"]