#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /run/php
	mkdir -p /var/run
	touch /run/php/php7.3-fpm.pid
	mkdir -p /var/www/html
	cd /var/www/html
	#wp core download --path="/var/www/wordpress" --allow-root
	#mv /var/www/wp-config.php /var/www/html/wordpress/wp-config.php
	chown -R www-data:www-data /var/www/html
	chown -R www-data:www-data /var/www/*

	wp config create --path="/var/www/wordpress" --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb:3306 --url=https://${URL}
	#wp core install --path="/var/www/wordpress" --allow-root --url=https://${URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	#wp user create --path="/var/www/wordpress" --allow-root ${WP_USR_LOGIN} ${WP_USR_EMAIL} --role=author --user_pass=${WP_USR_PASSWORD};

fi

exec "$@"
