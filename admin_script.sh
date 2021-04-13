#!/bin/bash
#Creating Code directory
createDirectory() {
    echo "Creating ${ENV} dir"
    sudo mkdir -p /var/www/html/${ENV}.docasap.com
    sudo mkdir -p /var/www/html/${ENV}-laravel-logs
    sudo mkdir -p /var/www/html/${ENV}.docasap.com
}

echo "Creating Directories"
createDirectory
