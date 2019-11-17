# docker-apache-laravel-server
Apache + PHP 7.3 server configured for Laravel running inside a Docker container.

## Laravel Application Quick Run

You can get up and running with a PHP application inside Docker in minutes.

- Run the command on your project root to start a docker container and attach the application. 
```
$ docker run -d -p 5000:80 --name=my-laravel-name -v $PWD:/var/www avonnadozie/apache-laravel-server
```

## Arguments

- `UID` - ID of user. Default 9000, Name: `devuser`, Group: `devuser`

## Environment Variables

- `WEBROOT` – Path to the web root. Default: `/var/www`
- `WEBROOT_PUBLIC` – Path to the web root. Default: `/var/www/public`
- `PHP_MEMORY_LIMIT` - PHP memory limit. Default: `128M`
- `PHP_POST_MAX_SIZE` - Maximum POST size. Default: `50M`
- `PHP_UPLOAD_MAX_FILESIZE` - Maximum file upload file. Default: `10M`.
- `STARTUP_SCRIPT` - Optional script to run after container starts. Path should be an absolute path eg. `/var/www/deploy/start.sh` or relative to `WEBROOT` eg. `deploy/start.sh`
- `CRON_FILE` - Optional path to a cron file, content of file will be copied to crontab. Path should be an absolute path eg. `/var/www/deploy/cron.txt` or relative to `WEBROOT` eg. `deploy/cron.txt`
- `PRODUCTION` – Application environment: 1 = Production, 0 = Development. Default: `0`

## Additional Packages Installed
git |
zip |
cron |
unzip |
composer |
sendmail |
g++

## PHP Modules Active
bcmath |
bz2 |
calendar |
Core |
ctype |
curl |
date |
dom |
fileinfo |
filter |
ftp |
gd |
hash |
iconv |
intl |
json |
libxml |
mbstring |
mysqlnd |
openssl |
pcre |
PDO |
pdo_mysql |
pdo_sqlite |
Phar |
posix |
readline |
Reflection |
session |
SimpleXML |
sodium |
SPL |
sqlite3 |
standard |
tokenizer |
xml |
xmlreader |
xmlwriter |
Zend OPcache |
zip |
zlib |

Source: [https://github.com/AVONnadozie/docker-apache-php-server](https://github.com/AVONnadozie/docker-apache-php-server)
