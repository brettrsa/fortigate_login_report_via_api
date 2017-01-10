#!/bin/bash
#
# get all logins from the last seven days
#
# start
#

# declare variables
email_src=email@domain.com
email_dst=email@domain.com
data=/var/tmp/data
user='user'
pass='pass'
db='vpn_logs'

mysql -u $user -p$pass $db -e "select date,time,event,ip,username from logs where date between adddate(now(),-7) and now() into outfile '$data'";

cat $data | mail -s "SSL VPN Access Logs" -aFrom:$email_src $email_dst

rm $data

# end
