######################################################
# ADD YOUR PROJECT SPECIFIC COMMANDS IN TO THIS FILE #
######################################################

# create a database for Magento installation
mysql -uroot -proot -e"create database magento;"

# clear the cache
rm -rf /var/www/public/var/cache