#!/bin/bash
 
# Update package list
sudo apt update
 
# Install Apache
sudo apt install -y apache2
 
# Install MySQL Server
sudo apt install -y mysql-server
  
# Install PHP and necessary extensions
sudo apt install -y php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-curl php7.4-json php7.4-cgi
 
# Restart Apache to apply changes
sudo systemctl restart apache2
 
# Check installed versions
echo "Installed versions:"
apache2 -v
mysql --version
php --version7.4
 
# Display additional instructions if needed
echo "LAMP stack installation completed. You may need to configure additional settings based on your requirements."
 
# End of script