#!/bin/bash

set -e

echo "Enter the domain name:"
read domain_name

echo "Copying conf into place"
sudo cp /etc/nginx/conf.d/default.conf.sample /etc/nginx/conf.d/$domain_name.conf

sed -i "s/example.com/$domain_name/g" /etc/nginx/conf.d/$domain_name.conf

echo "Add a new certificate? (y/n)"
read add_cert

if [ $add_cert == "y" ]
then
    echo "Adding a new certificate"
    sudo certbot --nginx -d $domain_name
fi

# Define the file
file="/etc/nginx/conf.d/$domain_name.conf"

# Use sed to replace the original block with the new block
sed -i "/location \//,/}/c\location / {\n    proxy_pass http:\/\/IP_ADDRESS:8081;\n    proxy_set_header Host \$host;\n    proxy_set_header X-Real-IP \$remote_addr;\n    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;\n    proxy_set_header X-Forwarded-Proto \$scheme;\n}" $file

echo "Restarting nginx"
sudo nginx -t
sudo systemctl restart nginx

# proxy_pass http://IP_ADDRESS:8081;
# proxy_set_header Host $host;
# proxy_set_header X-Real-IP $remote_addr;
# proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
# proxy_set_header X-Forwarded-Proto $scheme;

