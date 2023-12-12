FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/init.sql && rm -f /var/www/init.sql;

RUN service mysql stop
CMD ["mysqld"]
