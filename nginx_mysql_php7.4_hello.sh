#!/bin/bash
# Update package lists
sudo apt update
# Install MySQL Server
sudo apt install -y mysql-server
# Install Nginx
sudo apt install -y nginx
# Install PHP 7.4 and required extensions
sudo apt install -y php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml
# Configure Nginx to use PHP
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp /etc/nginx/sites-available/default.bak /etc/nginx/sites-available/default

# Restart Nginx to apply changes
sudo systemctl restart nginx
# Display PHP version
php -v
# Display Nginx version
nginx -v
# Display MySQL version
mysql --version
 
has context menu