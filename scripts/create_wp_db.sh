#!/bin/bash
MYSQL_ROOT_PASSWD="P@ssw0rd"
WP_DATABASE="worldpress"
WP_DB_USER="wpadmin"
WP_DB_PASSWD="P@ssw0rd"

mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWD << EOF
 show profiles;
EOF

if [ $? -ne 0 ] 
then
 mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWD << EOF
 CREATE DATABASE $WP_DATABASE;
 GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO "$WP_DB_USER"@"localhost" IDENTIFIED BY "$WP_DB_PASSWD";
 FLUSH PRIVILEGES;
 EXIT
EOF
else
 echo "skipping DB creation... DB exists."
fi
