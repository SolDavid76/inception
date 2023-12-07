FROM debian:buster
RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client wget
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools /var/www/
RUN chmod +x /var/www/wordpress.sh
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["/var/www/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
