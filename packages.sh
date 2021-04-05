#!/bin/bash
sudo yum update

#Installing required packages
echo "Installing require packages"
sudo yum install httpd httpd-devel -y
sudo yum install git -y
sudo amazon-linux-extras install php7.2 -y
php -v
sudo yum install php-mbstring -y
sudo yum install php-xml -y
sudo yum install mysql -y
curl -sL https://rpm.nodesource.com/setup_10.x | sudo  bash -
sudo yum install -y nodejs
sudo yum install gcc-c++ make -y
sudo npm i npm-install-version -g
sudo npm install gulp -g
npm install --unsafe-perm
sudo npm install -g @angular/cli
sudo yum install php-devel-y


#Installing php
echo "Installing php"
sudo yum install wget
sudo amazon-linux-extras install epel -y
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
sudo yum install yum-utils -y
sudo yum-config-manager --enable remi-php72
sudo yum update -y
sudo yum install php72 -y
sudo yum install php72-php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache -y
sudo yum install php-opcache -y
sudo yum install httpd php perl mod_ssl mod_perl -y
sudo yum install php-dom php-gd php-gmp php-mbstring php-mysqli  php-pdo_mysql php-pdo_mysqlite php-posix php-shmop php-SimpleXML php-soap php-sqlite3 php-ssh2 php-sysvmsg php-sysvsem php-sysvshm php-wddx php-xml php-xmlreader -y
sudo yum install libtool git apr apr-devel apr-util apr-util-devel -y
sudo yum install httpd-devel -y


#Installing mod-cloudflare
sudo yum install libtool git apr apr-devel apr-util apr-util-devel -y
cd /usr/local/src
sudo git clone https://github.com/cloudflare/mod_cloudflare.gi
cd /usr/local/src/mod_cloudflare
sudo /usr/bin/apxs -a -i -c mod_cloudflare.c
sudo systemctl restart httpd
httpd  -M | grep cloudflare
sudo yum install mod_ldap -y 
sudo yum install mod_authnz_ldap -y
sudo yum install php-pear -y
sudo pear install Mail
sudo pear install Mail_Mime
sudo pear install Net_SMTP
sudo pear install Net_Socket
sudo pear install PHP_Compat
sudo pear install XML_RPC2
sudo pear install XML_Util
sudo pear install Net_HL7-0.1.1
sudo pear install File_PDF-0.3.3

#For Image Hardening

echo "Applying Image Hardening"
unset HISTFILE
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
sudo rm -f /home/ec2-user/.bash_history
sudo rm -f /home/centos/.bash_history
sudo rm -f /root/.bash_history
sudo rm -rf /var/lib/cfn*unset HISTFILE
sudo service sftd stop
sudo service crond stop
sudo yum remove -y amazon-ssm-agent
sudo yum remove -y codedeploy-agent
sudo yum remove -y scaleft-server-tools
#sudo yum clean all -f
sudo rm -rf /etc/sft/
sudo rm -rf /var/lib/sftd*
sudo rm -f /etc/logrotate.d/sftd
sudo rm -rf /var/log/sftd*
sudo rm -f /root/scaleft_yum.sh
sudo rm -rf /etc/cfn/
sudo rm -rf /home/ec2-user/aws*
sudo rm -rf /etc/codedeploy-agent
sudo rm -rf /opt/codedeploy-agent
sudo rm -rf /var/log/amazon
sudo rm -rf /var/log/cloud*
sudo rm -rf /var/log/cfn*
sudo rm -rf /var/lib/cloud
sudo rm -rf /var/log/aws*
