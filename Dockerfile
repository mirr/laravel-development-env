FROM php:7.4-fpm

RUN apt-get update -y

# Update the package registry, upgrade the packages and install libraries
RUN apt-get update && apt-get install -y \
    git \
    libmcrypt-dev \
    libzip-dev zip unzip \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    default-mysql-client \
    default-libmysqlclient-dev \
    libgmp-dev \
    libmagick++-dev \
    libmagickwand-dev \
    libpq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \ 
    libxpm-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install imagick \
    && pecl install mcrypt

RUN docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gmp \
    && docker-php-ext-configure gd \
        --with-jpeg=/usr/include/ \
        --with-freetype=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install NodeJS (LTS)
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install nodejs -y \
    && node -v && npm -v
