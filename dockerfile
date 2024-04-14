# Use an official PHP runtime as a parent image with Apache
FROM php:8.0-apache

# Install SQLite3 extension
RUN docker-php-ext-install pdo pdo_sqlite

# Copy the content of the local src directory to /var/www/html/ inside the container
COPY . /var/www/html/

# Expose port 80 to allow communication to/from the server
EXPOSE 80

# Use the default Apache configuration
CMD ["apache2-foreground"]
