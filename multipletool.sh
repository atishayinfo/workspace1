#!/bin/bash

echo "Installation started"

# Function to check if a package is installed
check_package() {
    dpkg -l | grep -q "$1"
}

# Install Git if not already installed
if git --version > /dev/null 2>&1; then
    echo "git is already installed"
else
    echo "Installing git..."
    sudo apt-get update
    sudo apt-get install -y git
fi

# Install Tomcat if not already installed
if check_package "tomcat"; then
    echo "Tomcat is already installed"
else
    echo "Installing Tomcat..."
    sudo apt-get update
    sudo apt-get install -y tomcat9
fi

# Install Nginx if not already installed
if check_package "nginx"; then
    echo "Nginx is already installed"
else
    echo "Installing Nginx..."
    sudo apt-get update
    sudo apt-get install -y nginx
fi

# Install Docker if not already installed
if check_package "docker-ce"; then
    echo "Docker is already installed"
else
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
fi

# Check the status of Nginx
echo "Checking the status of Nginx..."
sudo systemctl status nginx

echo "Installation complete"
