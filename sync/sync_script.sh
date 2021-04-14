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

copySSlFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/certs/rds-combined-ca-bundle.pem /var/www/certs/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/certs/rds-ca-2015-us-east-1.pem /var/www/certs/
}

copyPackageConfigurationFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/php/php.ini /etc/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/php/newrelic.ini /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/php/opcache.ini /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/php/opcache-default.blacklist /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/apache/httpd.conf /etc/httpd/conf/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/apache/ssl.conf /etc/httpd/conf.d/
}

copyTLSCertificates() {
    echo "Copying TLS certs"
}

copyComposer() {
    cd /usr/local/bin
    sudo aws s3 cp   s3://da-app-configuration/${ENVIRONMENT}/sync/php/composer .
    sudo chmod 775 composer
}

copyApplicationConfigFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/sync/application/.env /var/www/html/${ENVIRONMENT}.docasap.com/
}

settingPermissions() {
    sudo mkdir -p /var/www/html/${ENVIRONMENT}.docasap.com/storage/cronjob_logs
    cd /var/www/html/${ENVIRONMENT}.docasap.com/
    sudo cp /usr/local/bin/composer /var/www/html/${ENVIRONMENT}.docasap.com/composer.phar
    sudo chmod 775 /var/www/html/${ENVIRONMENT}.docasap.com -R
    sudo chmod 775 composer.phar
    sudo chown apache:apache -R .
}

echo "Creating Directories"
createDirectory

echo "Copying SSl files from S3"
copySSlFiles

echo "Copying ini files and conf files from S3 for CRON application"
copyPackageConfigurationFiles

echo "Copying certificates from S3"
copyTLSCertificates

echo "Copying Composer files from S3 for CRON application"
copyComposer

echo "Copying application config files from S3 for CRON application"
copyApplicationConfigFiles

echo "Setting few permissions"
settingPermissions
