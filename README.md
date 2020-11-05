# Laravel Development

This based on [php:7.4-fpm](https://hub.docker.com/_/php) but with additional apps. I made this to be compatible with Laravel 8.x.

## Application Installed

* PHP 7.4.x
* NodeJS 14.x LTS
* cURL
* git
* composer

## PHP Extensions
* imagick
* mcrypt
* pdo_mysql
* gmp
* xml
* gd
* zip

## How to build the image
```
docker build -t laravel-development-env .
```

then use `docker images` to find the image ID.

With `docker run -it laravel-development-env` you can test if your changes are the desired ones.

Then tag it: `docker tag laravel-development-env <YOUR-USER>/laravel-development-env:latest`

and finally publish it: `docker push <YOUR-USER>/laravel-development-env`
