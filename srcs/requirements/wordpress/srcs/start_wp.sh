#!/bin/bash

sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

mkdir -p /var/www/localhost/wordpress
cd /var/www/localhost/wordpress

wp core download    --allow-root \
                    --quiet
wp core config      --allow-root \
                    --skip-check \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --dbhost=$DB_HOST \
                    --dbprefix=$DB_PREFIX \
                    --quiet
wp core install     --allow-root \
                    --url=$DOMAIN_NAME \
                    --title="ecole 21" \
                    --admin_user="trachell" \
                    --admin_password="trachell" \
                    --admin_email="trachell@student.21-school.ru" \
                    --quiet
wp user create      eke eke@example.com \
                    --role=author \
                    --user_pass="eke" \
                    --allow-root \
                    --quiet
wp user create      biba biba@example.com \
                    --role=author \
                    --user_pass="biba" \
                    --allow-root \
                    --quiet
wp user create      boba boba@example.com \
                    --role=author \
                    --user_pass="boba" \
                    --allow-root \
                    --quiet

exec php-fpm7 -R -F

sh