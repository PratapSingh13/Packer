#!/bin/bash
#Creating Code directory
createDirectory() {
    sudo mkdir -p /var/www/html/testing.docasap.com
    sudo mkdir -p /var/www/html/testing-laravel-logs
    sudo mkdir -p /var/www/html/synctesting.docasap.com
    sudo mkdir -p /da/log/audit/testing-admin-portal
    sudo chown apache:apache /da/log/audit/testing-admin-portal -R
    sudo mkdir -p /da/log/audit/testing-admin-portal
    sudo chmod 771 /da/log/audit/testing-admin-portal/
}

echo "Creating Directories"
createDirectory
