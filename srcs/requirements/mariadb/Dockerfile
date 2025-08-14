FROM            debian:bullseye

RUN             apt update && apt upgrade -y && \
                apt install -y mariadb-server gettext-base

RUN             mkdir -p /run/mysqld/ && chown mysql:mysql /run/mysqld

RUN             sed -i 's|bind-address            = 127.0.0.1|bind-address = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY            ./conf/init.sql /init.sql

COPY            ./tools/entrypoint.sh /entrypoint.sh

RUN             chmod +x /entrypoint.sh

EXPOSE          3306

ENTRYPOINT      ["/entrypoint.sh"]

CMD             ["mysqld", "--init-file=/tmp/init.sql"]
