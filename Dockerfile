FROM php:5.6-cli

# PHP Extensions
RUN apt-get update \
    && apt-get -y install libtidy-dev \
    && docker-php-ext-install tidy \

    && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip
