##################################################
ADD YOUR PROJECT SPECIFIC COMMANDS IN TO THIS FILE
##################################################

# create a database for Magento installation
mysql -uroot -proot -e"create database magento;"

# ensure the media root dir is writable
chmod 777 /var/www/public/media

# clear the cache
rm -rf /var/www/public/var/cache