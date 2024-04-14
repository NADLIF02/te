# Use an official PHP runtime as a parent image with Apache
FROM php:8.0-apache

# Install system dependencies for SQLite and other tools
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    pkg-config \
    gawk

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_sqlite

# Copy the content of the local src directory to /var/www/html/ inside the container
COPY . /var/www/html/

# Expose port 80 to allow communication to/from server
EXPOSE 80

# Use the default Apache configuration
CMD ["apache2-foreground"]
