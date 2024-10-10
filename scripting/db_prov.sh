#!/bin/bash

# Update the package list to ensure we have the latest information on available packages
echo "Check for updates..."
sudo apt update -y
echo "Check complete."

# Upgrade all installed packages to their latest versions
echo "Check for upgrades..."
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo "Upgrades complete."

# Install gnupg and curl, which are required for downloading and verifying packages
echo "Install gnupg..."
sudo apt-get install gnupg curl
echo "gnupg installed."

# Download the GPG key for the MongoDB repository to verify package signatures
echo "Download MongoDB GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg --yes -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "GPG downloaded..."

# Register the MongoDB repository in the system's package source list
echo  "Register MongoDB to system..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "Register complete."

# Update the package list again to include the MongoDB repository
echo "Run update..."
sudo DEBIAN_FRONTEND=noninteractive apt update -y
echo "Update complete."

# Install specific MongoDB components, ensuring the specified versions are installed
echo "Install MongoDB components..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
echo "MongoDB components downloaded."

# Start the MongoDB service
echo "Start MongoDB..."
sudo systemctl start mongod
echo "MongoDB started."

# Configure MongoDB to allow remote connections by modifying the bindIp setting
echo "Configuring MongoDB to allow remote connections..."
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
echo "Remote connections allowed."

# Restart MongoDB to apply the configuration changes
echo "Restart to apply changes..."
sudo systemctl restart mongod
echo "Changes applied."

# Enable the MongoDB service to start automatically on system boot
echo "Enable MongoDB"
sudo systemctl enable mongod
echo "MongoDB enabled."

# Check if MongoDB is running successfully and provide feedback
if sudo systemctl status mongod | grep -q "active (running)"; then
        echo "MongoDB is running successfully."
else
        echo "MongoDB is not running. Please check logs."
        exit 1
fi

echo "MongoDB configuration complete and ready for application to connect."