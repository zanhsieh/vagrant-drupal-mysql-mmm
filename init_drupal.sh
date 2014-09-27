#!/bin/bash

sudo yum install -y http://linuxsoft.cern.ch/cern/slc6X/x86_64/yum/updates/php-pecl-uploadprogress-1.0.1-1.slc6.x86_64.rpm

cd /home/vagrant

/usr/bin/wget http://ftp.drupal.org/files/projects/drupal-7.31.tar.gz

sudo tar zxvf drupal-7.31.tar.gz -C /var/www/html/
sudo mv /var/www/html/drupal-7.31 /var/www/html/drupal

cd /var/www/html/drupal
sudo cp sites/default/default.settings.php sites/default/settings.php
sudo chmod a+w sites/default/settings.php
sudo chmod a+w sites/default

/vagrant/init_sync.sh drupal

# Configuration
M1_HOST="192.168.30.101"
M2_HOST="192.168.30.102"
M1_CONN=" -u root -h $M1_HOST "
M2_CONN=" -u root -h $M2_HOST "
MYSQL='mysql'

# Drupal user has been created on puppet provision; now grant the privileges
SQL="GRANT ALL PRIVILEGES ON drupal.* TO 'druser'@'192.168.30.%' IDENTIFIED BY 'druser';"
$MYSQL $M1_CONN -e "$SQL"
$MYSQL $M2_CONN -e "$SQL"

SQL="FLUSH PRIVILEGES;"
$MYSQL $M1_CONN -e "$SQL"
$MYSQL $M2_CONN -e "$SQL"

sudo service httpd restart