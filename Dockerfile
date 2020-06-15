FROM php:7.2-cli

WORKDIR /usr/src/myapp

# Dev Utils
RUN apt-get update && apt-get install -y \
	git \
	vim \
    curl

# PHP Extensions
RUN apt-get -y install libtidy-dev \
    && docker-php-ext-install tidy \
    && apt-get -y install zlib1g-dev \
    && docker-php-ext-install zip

# Add composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

# xdebug
RUN pecl install xdebug

RUN echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so' >> /usr/local/etc/php/php.ini

# Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

# Headless unit tests
RUN apt-get install -y chromium chromium-l10n
