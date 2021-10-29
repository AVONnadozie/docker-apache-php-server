#!/bin/bash

# UPDATE THE WEBROOT IF REQUIRED.
if [[ ! -z "${WEBROOT_PUBLIC}" ]]; then
    sed -ri -e 's!/var/www/html!${WEBROOT_PUBLIC}!g' /etc/apache2/sites-available/*.conf
    sed -ri -e 's!/var/www/!${WEBROOT_PUBLIC}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
else
    export WEBROOT=/var/www
    export WEBROOT_PUBLIC=/var/www/html
fi

cd ${WEBROOT}

# Setup cron file
if [[ ! -z "${CRON_FILE}" ]]; then
    # Copy hello-cron file to the cron.d directory
    cp ${CRON_FILE} /etc/cron.d/root
    # Give execution rights on the cron job
    chmod 0644 /etc/cron.d/root
    # Apply cron job
    crontab /etc/cron.d/root
    cron
fi

## PRODUCTION LEVEL CONFIGURATION.
if [[ "${PRODUCTION}" == "1" ]]; then
    sed -i -e "s/display_errors = On/display_errors = Off/g" ${PHP_INI_DIR}/php.ini
fi

# PHP & SERVER CONFIGURATIONS.
if [[ ! -z "${PHP_MEMORY_LIMIT}" ]]; then
    sed -i "s/memory_limit = 128M/memory_limit = ${PHP_MEMORY_LIMIT}M/g"  ${PHP_INI_DIR}/php.ini
fi

if [ ! -z "${PHP_POST_MAX_SIZE}" ]; then
    sed -i "s/post_max_size = 50M/post_max_size = ${PHP_POST_MAX_SIZE}M/g" ${PHP_INI_DIR}/php.ini
fi

if [ ! -z "${PHP_UPLOAD_MAX_FILESIZE}" ]; then
    sed -i "s/upload_max_filesize = 10M/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}M/g" ${PHP_INI_DIR}/php.ini
fi


# Run startup script.
if [[ ! -z "${STARTUP_SCRIPT}" ]]; then
    bash ${STARTUP_SCRIPT}
fi

# Start Apache
apache2-foreground