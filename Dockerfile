FROM php:7.4-fpm

ENTRYPOINT ["/opt/env_to_ini/entrypoint.sh"]
