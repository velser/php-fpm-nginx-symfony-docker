FROM php:8.0.12-fpm-alpine3.13

WORKDIR /var/www/html

RUN apk update && apk add bash icu-dev && apk add git
RUN apk add --no-cache nginx supervisor
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-enable opcache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

COPY .docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY .docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY .docker/php/php.ini /usr/local/etc/php/conf.d/php_settings.ini
COPY .docker/supervisord/supervisord.conf /etc/supervisord.conf
COPY .docker/supervisord/program.conf /etc/supervisor.d/program.conf

RUN addgroup -S -g 1000 app \
  && adduser -G app -S -u 1000 app

COPY --chown=app .docker/prod/start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /var/www/html
RUN chown -R app:app /var/www/html && \
    chown -R app:app /run && \
    chown -R app:app /var/lib/nginx && \
    chown -R app:app /var/log/nginx && \
    chown app:app /etc/supervisord.conf

USER app

WORKDIR /var/www/html
COPY --chown=app ./src /var/www/html

CMD ["/start.sh"]
