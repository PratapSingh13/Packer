#!/bin/bash
#Creating Code directory
createDirectory() {
    echo "Creating ${ENVIRONMENT} directories"
    sudo mkdir -p /var/www/html/${ENVIRONMENT}.docasap.com/public
    sudo mkdir -p /var/www/html/${ENVIRONMENT}-laravel-logs
    sudo mkdir -p /var/www/html/sync${ENVIRONMENT}.docasap.com
    sudo mkdir -p /da/log/audit/${ENVIRONMENT}-admin-portal
    sudo chown apache:apache /da/log/audit/${ENVIRONMENT}-admin-portal -R
    sudo mkdir -p /da/log/audit/${ENVIRONMENT}-admin-portal
    sudo chmod 771 /da/log/audit/${ENVIRONMENT}-admin-portal/
}
copySSlFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/certs/rds-combined-ca-bundle.pem /var/www/certs/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/certs/rds-ca-2015-us-east-1.pem /var/www/certs/
}
copyPackageConfigurationFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/php/php.ini /etc/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/php/newrelic.ini /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/php/opcache.ini /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/php/opcache-default.blacklist /etc/php.d/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/apache/httpd.conf /etc/httpd/conf/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/apache/ssl.conf /etc/httpd/conf.d/
}
copyTLSCertificates() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/certs/docasap_wildcard.crt /etc/pki/tls/certs/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/certs/docasap_wildcard.key /etc/pki/tls/private/
}
copyIndexFile() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/apache/index.html /var/www/html/${ENVIRONMENT}.docasap.com/public/
}
copyComposer() {
    cd /usr/local/bin
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/php/composer .
    sudo chmod 775 composer
}
copyApplicationConfigFiles() {
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/.env /var/www/html/${ENVIRONMENT}.docasap.com/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/da_encKeys_passwds.php /var/www/html/${ENVIRONMENT}.docasap.com/public/lib/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/environment.js /var/www/html/testing.docasap.com/public/l_js/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/production2test.php /var/www/html/${ENVIRONMENT}.docasap.com/public/lib/
    sudo aws s3 cp s3://da-stg-major/cfg/admin/app/dbConnect.php /var/www/html/${ENVIRONMENT}.docasap.com/public/lib/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/robots.txt /var/www/html/${ENVIRONMENT}.docasap.com/public/
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/htaccess /var/www/html/${ENVIRONMENT}.docasap.com/public/.htaccess
    sudo aws s3 cp s3://da-app-configuration/${ENVIRONMENT}/admin/application/cache_enable.ini /var/www/html/${ENVIRONMENT}.docasap.com/config/
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
echo "Copying ini files and conf files from S3 for ADMIN application"
copyPackageConfigurationFiles
echo "Copying certificates from S3"
copyTLSCertificates
echo "Copying html from S3"
copyIndexFile
echo "Copying Composer files from S3 for ADMIN application"
copyComposer
echo "Copying application config files from S3 for ADMIN application"
copyApplicationConfigFiles
echo "Setting few permissions"
settingPermissions