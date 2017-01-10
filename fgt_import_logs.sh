#!/bin/bash
#
# import formatted log file into database
#
# start
#

# set variables
user='user'
pass='pass'
db='vpn_logs'

# import formatted logs
mysql -u $user -p$pass $db -e "LOAD DATA INFILE '/var/data/format' INTO TABLE logs FIELDS TERMINATED BY ' ' (date, time, event, ip, username);"

# delete duplicate logs
mysql -u $user -p$pass $db -e "DELETE n1 FROM logs n1, logs n2 WHERE n1.id < n2.id AND n1.time = n2.time;"

# remove formatted log
rm /var/data/format

# end
