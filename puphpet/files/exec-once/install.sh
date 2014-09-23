#!/bin/bash

echo "CD into php52 files dir"
cd /var/www/puphpet/files/php52/
echo "Running php52 install script"
sudo bash installphp52.sh

sudo apt-get install -y php-pear sed
#echo "adding symfony pear channel"
#sudo pear channel-discover pear.symfony-project.com
#echo "installing symfony 1.1.6 with pear"
#sudo pear install symfony/symfony-1.1.6
echo "Adding required pear packages"
sudo pear install Date-1.5.0a1 MDB2-2.4.1 MDB2_Driver_mysql-1.4.1 Mail-1.1.14 Mail_Mime-1.8.2

sudo a2enmod headers
sudo service apache2 restart

echo "CD into root"
cd /var/www

echo "running project install script"
bash install.sh

echo "Update htaccess"
#read -p "What do you want to set your .htaccess RewriteBase to [Default is /]: " rewriteBase
#rewriteBase=${rewriteBase:-/}
sed -i.bak s@/path/to/web/@/@g /var/www/web/.htaccess
