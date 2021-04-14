#!/bin/bash
#Creating Code directory
createDirectory() {
    sudo mkdir -p /var/www/html/${ENVIRONMENT}.docasap.com
    sudo mkdir -p /var/www/html/${ENVIRONMENT}-laravel-logs
    sudo mkdir -p /var/www/html/sync${ENVIRONMENT}.docasap.com
    sudo mkdir -p /da/log/audit/${ENVIRONMENT}-admin-portal
    sudo chown apache:apache /da/log/audit/${ENVIRONMENT}-admin-portal -R
    sudo mkdir -p /da/log/audit/${ENVIRONMENT}-admin-portal
    sudo chmod 771 /da/log/audit/${ENVIRONMENT}-admin-portal/
}

echo "Creating Directories"
createDirectory
