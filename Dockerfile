FROM opendatastack/docker-symfony:latest
MAINTAINER Noomane Achraf<noomane@angrycactus.io>

# Nginx
COPY ./config/nginx/default.conf /etc/nginx/sites-available/default

# Supervisor
COPY config/supervisord/conf.d/ /etc/supervisor/conf.d/

# PHP
COPY config/php/fpm/pool.d/www.conf /etc/php/7.0/fpm/pool.d/www.conf

COPY ./scripts/start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80

CMD ["/bin/bash", "/start.sh"]
