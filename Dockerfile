FROM php:7.4-apache
RUN apt-get update
RUN apt-get install -y wget vim git zip unzip zlib1g-dev libzip-dev libpng-dev
RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip pcntl exif
RUN a2enmod headers expires rewrite
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
WORKDIR /var/www
