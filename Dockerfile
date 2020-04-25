FROM php:7.4-fpm

ADD env_to_ini  /opt/env_to_ini

ENTRYPOINT ["/opt/env_to_ini/entrypoint.sh"]
