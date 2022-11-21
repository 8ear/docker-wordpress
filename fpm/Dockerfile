FROM wordpress:fpm

RUN set -eu \
    # Install pdo_mysql
    ; docker-php-ext-install pdo_mysql \
    ; docker-php-ext-install intl \
    # Install Memcached
    ; apt update && apt install -y \
        libmemcached-dev \
        zlib1g-dev \
    ; rm -rf /var/lib/apt/lists/* \
    ; pecl install memcached \
	; docker-php-ext-enable memcached \
    # Install Redis
    ; pecl install redis && docker-php-ext-enable redis \
    ;
