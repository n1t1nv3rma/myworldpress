#!/bin/bash
mysql --host=localhost --user=root --password=P@ssw0rd << EOF
 CREATE DATABASE worldpress;
 GRANT ALL PRIVILEGES ON worldpress.* TO "wpadmin"@"localhost" IDENTIFIED BY "wpadm1n!";
 FLUSH PRIVILEGES;
 EXIT
EOF
