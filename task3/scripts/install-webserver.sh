#!/bin/bash
# =====================================================================
# install-webserver.sh
# Purpose : Automates setup of a Nginx web server on Amazon Linux 2023
# Author  : Shahanaaz
# Task    : AWS Internship - Week 1 - Task 3 (EC2 Web Server Deployment)
# =====================================================================

echo "Step 1: Updating system packages..."
sudo dnf update -y

echo "Step 2: Installing Nginx web server..."
sudo dnf install nginx -y

echo "Step 3: Starting Nginx service..."
sudo systemctl start nginx

echo "Step 4: Enabling Nginx to start automatically on system boot..."
sudo systemctl enable nginx

echo "Step 5: Checking Nginx service status..."
sudo systemctl status nginx --no-pager

echo "Step 6: Deploying custom index.html page..."
if [ ! -f /usr/share/nginx/html/index.html.bak ]; then
    sudo cp /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bak 2>/dev/null
fi

echo "Step 7: Setup complete! Visit http://<your-public-ip> in your browser."