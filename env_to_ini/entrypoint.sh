#!/bin/bash
set -e

: ${PHP_INI_FILE_SOURCE:="/usr/local/etc/php/php.ini-production"}
: ${PHP_INI_FILE_TARGET:="$PHP_INI_DIR/php.ini"}

EXTRA_PHP_INI=$(php /opt/env_to_ini/env_to_ini.php)

cp $PHP_INI_FILE_SOURCE $PHP_INI_FILE_TARGET

if [ -n "$EXTRA_PHP_INI" ]; then
  echo "" >> $PHP_INI_FILE_TARGET
  echo "" >> $PHP_INI_FILE_TARGET
  echo "; From env variables" >> $PHP_INI_FILE_TARGET
  echo "" >> $PHP_INI_FILE_TARGET
  echo -e "$EXTRA_PHP_INI" >> $PHP_INI_FILE_TARGET

  echo "Extra Php configuration:"
  echo -e "$EXTRA_PHP_INI"
fi

exec "$@"
