#!/bin/bash
domain="test.techpath.pro"
 
sudo mkdir -p /var/www/"$domain"/public_html
sudo chown -R $USER:$USER /var/www/"$domain"/public_html
sudo chmod -R 755 /var/www/"$domain"/public_html
sudo find /var/www/"$domain"/public_html -type d -exec chmod g+s {} \;
 
# Define the file content
file_content="""server {
    listen 80;
    server_name "$domain" www."$domain";
 
    root /var/www/"$domain"/public_html;
    index index.php index.html;
 
    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }
 
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock; # Adjust the PHP version as needed
    }
 
    location ~ /\.ht {
        deny all;
    }
}
"""
# Create hello.txt file
echo "$file_content" > /etc/nginx/sites-available/"$domain"
 
sudo ln -s /etc/nginx/sites-available/"$domain" /etc/nginx/sites-enabled/
 
sudo nginx -t
 
sudo systemctl restart nginx
 
 
# Display a message indicating the file creation
echo "Site $domain is hosted!"