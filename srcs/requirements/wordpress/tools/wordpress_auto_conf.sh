#!/bin/bash

sleep 10
mkdir -p /var/run/php-fpm/php7.3-fpm.pid
chown -R www-data:www-data /var/run/php-fpm
sed -i 's/^pid =.*/pid = \/var\/run\/php-fpm\/php7.3-fpm.pid/' /etc/php/7.3/fpm/php-fpm.conf

wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=$URL --title=$WP_TITLE --admin_user=$WP_ADIMN_USR --admin_password=$WP_ADMIN_PASSWORD
wp user create $WP_USR --user_pass=$WP_USR_PASSWORD --role=author

/usr/sbin/php-fpm7.3 -F
