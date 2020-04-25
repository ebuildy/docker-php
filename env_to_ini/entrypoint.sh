#!/bin/bash
set -e

cd /opt/env_to_ini

php env_to_ini.php

EXTRA_PHP_INI=$(php env_to_ini.php)

cp php.ini  /usr/local/etc/php/php.ini

if [ -n "${EXTRA_PHP_INI}" ]; then
  echo "" >> /usr/local/etc/php/php.ini
  echo "" >> /usr/local/etc/php/php.ini
  echo "; From env variables" >> /usr/local/etc/php/php.ini
  echo "" >> /usr/local/etc/php/php.ini
  echo $EXTRA_PHP_INI >> /usr/local/etc/php/php.ini

  echo "Extra Php configuration:"
  echo $EXTRA_PHP_INI
fi

exec "$@"
