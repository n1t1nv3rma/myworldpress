#!/bin/bash

# start mysql server
/etc/init.d/mysql start

echo "securing MySql..."
PASSWD="P@ssw0rd"
#/usr/bin/mysql_secure_installation < /var/tmp/mysql.resp

mysqladmin -u root password $PASSWD

mysql --host=localhost --user=root --password=$PASSWD << EOF
# remove anonymous users
DELETE FROM mysql.user WHERE User='';

# remove remote root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# remove test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

# reload privilege tables
FLUSH PRIVILEGES;

EOF
