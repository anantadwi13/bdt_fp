#!/bin/bash


# Configuring laravel env
sed -i "s/.*APP_NAME.*/APP_NAME=${APP_NAME}/" /var/www/pweb-reservasi/.env
sed -i "s/.*DB_HOST.*/DB_HOST=${DB_HOST}/" /var/www/pweb-reservasi/.env
sed -i "s/.*DB_PORT.*/DB_PORT=${DB_PORT}/" /var/www/pweb-reservasi/.env
sed -i "s/.*DB_DATABASE.*/DB_DATABASE=${DB_DATABASE}/" /var/www/pweb-reservasi/.env
sed -i "s/.*DB_USERNAME.*/DB_USERNAME=${DB_USERNAME}/" /var/www/pweb-reservasi/.env
sed -i "s/.*DB_PASSWORD.*/DB_PASSWORD=${DB_PASSWORD}/" /var/www/pweb-reservasi/.env

# Waiting for db server ready
sleep 60

service apache2 restart

# Migrating & seeding
if  [ ! -f "/var/www/initialized" ]; then
    mysql -h ${DB_HOST} --port=${DB_PORT} -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};"
    php artisan migrate --seed
    touch /var/www/initialized
fi