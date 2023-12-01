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
 
    location / {
 
        proxy_pass "$domain";  # Adjust the port if needed
 
        proxy_set_header Host $host;
 
        proxy_set_header X-Real-IP $remote_addr;
 
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
 
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