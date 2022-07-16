FROM php:7.3-apache

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

RUN apt-get update  \
    && apt-get -y install \
    git \
    zip \
    unzip \
    vim \
    libxml2-dev
RUN docker-php-ext-install pdo_mysql bcmath mbstring soap mysqli
RUN docker-php-ext-enable mysqli
RUN a2enmod rewrite
RUN echo "NameVirtualHost *:80" >> /etc/apache2/ports.conf
RUN groupadd -g 1000 user
RUN useradd user -u 1000 -g 1000 -M

WORKDIR /var/www/html

EXPOSE 8080
