FROM wordpress:4.9.8-php7.2-apache

# Add system packages
RUN apt-get update && apt-get install -y sudo less mysql-client

# Add & configure PHP
RUN docker-php-ext-install exif
ADD uploads.ini /usr/local/etc/php

# Add wordpress cli
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
