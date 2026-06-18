#!/bin/bash

cd /var/www

composer install

mkdir -p /var/www/storage/framework/{cache,sessions,views}

chown -R www-data:www-data /var/www/storage

chmod -R 775 /var/www/storage

php artisan cache:clear
php artisan route:clear
php artisan config:clear
php artisan view:clear
php artisan migrate

/usr/bin/supervisord -c /etc/supervisord.conf
