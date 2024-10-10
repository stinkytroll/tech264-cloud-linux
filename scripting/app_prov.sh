#!/bin/bash

# Check for updates
echo "update sources list..."
sudo apt update -y
echo "update complete"

# Upgrades those checks
echo "upgrade any packages available..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "upgrade complete"

# Install Nginx web server
sudo apt install -y nginx
echo "nginx installed"

# Check the syntax of the Nginx configuration files
echo "Checking syntax..."
sudo nginx -t
echo "Syntax checked."

# Restart Nginx to apply any configuration changes made
echo "Restart nginx to apply changes"
sudo systemctl restart nginx
echo "Restart complete."

# Update the Nginx configuration to replace the try_files directive with a proxy_pass to the Node.js app
echo "Find proxy pass line and replace it..."
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo "Nginx reverse proxy configuration updated"

# Install Node.js version 20 from NodeSource
echo "install nodejs v20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# Check the installed version of Node.js
echo "check nodejs version..."
node -v
echo "nodejs v20 installed"

# Install PM2, a process manager for Node.js applications
echo "installing PM2..."
sudo npm install -g pm2
echo "PM2 installed!"

# Stop all PM2 processes before starting new ones
echo "Stop pm2 processes..."
pm2 stop all
echo "Processes stopped."

# Clone the specified Git repository into a folder named 'repo'
echo "Cloning App Git repo..."
git clone https://github.com/stinkytroll/tech264-sparta-app.git repo
echo "App Git repo cloned!"

# Change directory to the app folder within the cloned repository
echo "cd repo / app..."
cd repo/app
echo "Complete."

# Set the DB_HOST environment variable for MongoDB connection
echo "Set the DB_HOST environment variable..."
export DB_HOST=mongodb://10.0.3.5:27017/posts
printenv DB_HOST
echo "DB_HOST set to $DB_HOST."

# Install app dependencies and start the Node.js application in the background using PM2
echo "NPM install and start in background..."
npm install
pm2 start app.js
echo "App started in background!"