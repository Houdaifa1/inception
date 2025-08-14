#!/bin/bash
set -e

if [ ! -f /var/www/html/index.php ]; then
    echo "[INFO] WordPress not found in volume, copying..."
    cp -r /wordpress_src/* /var/www/html/
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    sed -i \
      -e "s|username_here|$DB_USER|" \
      -e "s|password_here|$DB_PASSWORD|" \
      -e "s|database_name_here|$DB_NAME|" \
      -e "s|localhost|$DB_HOST|" \
      /var/www/html/wp-config.php 

    echo  "define('WP_HOME', 'https://$DOMAIN_NAME');" >> /var/www/html/wp-config.php
    echo  "define('WP_SITEURL', 'https://$DOMAIN_NAME');" >> /var/www/html/wp-config.php
    echo  "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php

fi

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "[INFO] Starting PHP-FPM..."
exec "$@"
