######################################################
# DO NOT MODIFY. THIS FILE IS FOR ENVIRONMENT CONFIG #
# ADD YOUR PROJECT SPECIFIC COMMANDS TO BOOTSTRAP.SH #
######################################################

# install services
apt-get update
apt-get install -y php5-xdebug

# stop services
apachectl stop
service mysql stop

# change apache user and group to vagrant
sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
chown -R vagrant:www-data /var/lock/apache2

# optimise php settings
sed -i 's/memory_limit = 128M/memory_limit = -1/' /etc/php5/apache2/php.ini
sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 8M/' /etc/php5/apache2/php.ini

# optimise mysql settings
sed -i 's/key_buffer\t\t= 16M/key_buffer = 128M/' /etc/mysql/my.cnf
sed -i 's/query_cache_limit\t= 1M/query_cache_limit = 5M/' /etc/mysql/my.cnf
sed -i 's/query_cache_size        = 16M/query_cache_size = 256M/' /etc/mysql/my.cnf
sed -i 's/# ssl-key=\/etc\/mysql\/server-key.pem/# ssl-key=\/etc\/mysql\/server-key.pem\n\nINNODB_SETTINGS_PLACEHOLDER/' /etc/mysql/my.cnf
sed -i 's/INNODB_SETTINGS_PLACEHOLDER/innodb_flush_method = O_DIRECT\nINNODB_SETTINGS_PLACEHOLDER/' /etc/mysql/my.cnf
sed -i 's/INNODB_SETTINGS_PLACEHOLDER/innodb_log_file_size = 1000M\nINNODB_SETTINGS_PLACEHOLDER/' /etc/mysql/my.cnf
sed -i 's/INNODB_SETTINGS_PLACEHOLDER/innodb_log_buffer_size = 32M\nINNODB_SETTINGS_PLACEHOLDER/' /etc/mysql/my.cnf
sed -i 's/INNODB_SETTINGS_PLACEHOLDER/innodb_buffer_pool_size = 256M\nINNODB_SETTINGS_PLACEHOLDER/' /etc/mysql/my.cnf
sed -i 's/INNODB_SETTINGS_PLACEHOLDER//' /etc/mysql/my.cnf
rm -rf /var/lib/mysql/ib_logfile*

# configure xdebug
sed -i 's/zend_extension=xdebug.so/zend_extension = xdebug.so\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER/xdebug.remote_enable = On\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER/xdebug.remote_connect_back = On\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER/xdebug.remote_port = 10001\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER/xdebug.idekey = "PHPSTORM"\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER/xdebug.max_nesting_level = 500\nXDEBUG_SETTINGS_PLACEHOLDER/' /etc/php5/mods-available/xdebug.ini
sed -i 's/XDEBUG_SETTINGS_PLACEHOLDER//' /etc/php5/mods-available/xdebug.ini

# restart services
apachectl start
service mysql start

# remove the native scotchbox database
mysql -uroot -proot -e"drop database scotchbox;"