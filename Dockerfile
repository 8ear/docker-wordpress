FROM wordpress:fpm

RUN set -eu \
    ; docker-php-ext-install pdo_mysql \
    ; apt update && apt install -y \
        libmemcached-dev \
        zlib1g-dev \
    ; rm -rf /var/lib/apt/lists/* \
    ; pecl install memcached \
	; docker-php-ext-enable memcached \
    ; pecl install redis && docker-php-ext-enable redis
