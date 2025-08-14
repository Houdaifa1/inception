FROM    debian:bullseye

RUN     apt update && apt upgrade -y && \
        apt install -y php7.4 php7.4-fpm  php7.4-xml && \
        apt install -y php7.4-mysql php7.4-curl tar wget php7.4-gd
          
RUN     mkdir -p /run/php/

RUN     mkdir -p /var/www/html/

RUN     sed -i 's|listen = /run/php/php7.4-fpm.sock| listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

RUN     wget https://wordpress.org/wordpress-6.8.1.tar.gz

RUN     tar -xvf wordpress-*tar.gz

RUN     rm wordpress-*tar.gz

RUN     mv wordpress /wordpress_src

COPY    ./tools/entrypoint.sh   /entrypoint.sh

RUN     chmod +x /entrypoint.sh


EXPOSE  9000

ENTRYPOINT [ "/entrypoint.sh" ]

CMD     ["php-fpm7.4", "-F"]
