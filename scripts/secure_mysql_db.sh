#!/bin/bash
echo "securing MySql..."
/usr/bin/mysql_secure_installation < /var/tmp/mysql.resp
