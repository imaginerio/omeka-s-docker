FROM php:7.3-apache

RUN a2enmod rewrite

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq -y upgrade
RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install \
    unzip \
    wget \
    curl \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libjpeg-dev \
    libmemcached-dev \
    libzip-dev \
    zlib1g-dev \
    imagemagick \
    libmagickwand-dev \
    libvips-tools

# Install the PHP extensions we need
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql mysqli gd zip exif

RUN pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN echo 'memory_limit=512M' > /usr/local/etc/php/conf.d/memory-limit.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer |php \
    && mv composer.phar /usr/local/bin/composer

RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz \
    && tar xf ImageMagick.tar.gz

RUN cd ImageMagick-7* && ./configure && make && make install
RUN ldconfig /usr/local/lib

# Add the Omeka-S PHP code
COPY ./omeka-s-3.0.1.zip /var/www/
RUN unzip -q /var/www/omeka-s-3.0.1.zip -d /var/www/ \
    &&  rm /var/www/omeka-s-3.0.1.zip \
    &&  rm -rf /var/www/html/ \
    &&  mv /var/www/omeka-s/ /var/www/html/

COPY ./imagemagick-policy.xml /etc/ImageMagick-6/policy.xml
COPY ./.htaccess /var/www/html/.htaccess

# Download modules not added as submodules
COPY ./modules /var/www/html/modules
RUN cd /var/www/html/modules/CSVImport && composer install
RUN cd /var/www/html/modules/IiifServer && composer install --no-dev
RUN cd /var/www/html/modules/ImageServer && composer install --no-dev
RUN cd /var/www/html/modules/UniversalViewer && composer install --no-dev


# Create one volume for files and config
RUN mkdir -p /var/www/html/volume/config/
COPY ./database.ini /var/www/html/volume/config/
RUN rm /var/www/html/config/database.ini \
    && ln -s /var/www/html/volume/config/database.ini /var/www/html/config/database.ini \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod 600 /var/www/html/volume/config/database.ini \
    && chmod 600 /var/www/html/.htaccess 

VOLUME /var/www/html/volume/

CMD ["apache2-foreground"]
