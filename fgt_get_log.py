#!/usr/bin/python
#
# get vpn logs from fortigate device via api
#
# start
#

import requests
import urllib3

requests.packages.urllib3.disable_warnings()

fortigate_host = 'ip:port'
fortigate_user = 'username'
fortigate_pass = 'password'

output = open('/var/data/raw_log', 'w')

login_url = 'https://%s/logincheck' % fortigate_host
login_payload = {'username': fortigate_user, 'secretkey': fortigate_pass}

r = requests.post(login_url, data=login_payload, verify=False)
cookiejar = r.cookies

r = requests.get('https://%s/p/logs/vpn_events/raw/?filter=[]' % fortigate_host, cookies=cookiejar, verify=False)

output.write(r.content)
output.close()

# end
