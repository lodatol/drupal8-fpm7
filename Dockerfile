FROM php:7-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \ 
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libpq-dev \ 
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr  --with-png-dir=/usr \
    && docker-php-ext-install -j$(nproc) gd mbstring opcache pdo pdo_mysql pdo_pgsql zip

RUN \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
ln -s /usr/local/bin/composer /usr/bin/composer && \
composer global require drush/drush:~8

RUN echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc

#needed by drush
RUN apt-get install -y sqlite mysql-client wget git 

