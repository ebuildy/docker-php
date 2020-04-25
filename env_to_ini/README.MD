Define any Php configuraion, via env variable:

```
PHP_DEFINE_DISPLAY_ERRORS = Off
```

Build a single Docker image for dev & production!

## Explain

We define a entrypoint, that call a Php script.

The Php script loop env variables, if env name starts by ``PHP_DEFINE_`` , bingo!

After, the entrypoint prepend configuration lines to php.ini.

## Usage

```
docker run -ti --rm --env PHP_DEFINE_OPCACHE_ENABLE=Off ....
```
