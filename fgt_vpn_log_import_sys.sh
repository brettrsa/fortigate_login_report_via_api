#!/bin/bash
#
# call scripts that download fortigate vpn logs, format logs, import logs, check for duplicate entries
# and run a query that outputs data and emails the output
#
# start
#


# call script that downloads vpn logs via forti os api
/usr/local/bin/fgt_get_log.py

# call script that formats logs and move logs to archive
/usr/local/bin/fgt_format_logs.sh

# call script that imports logs into db and checks for duplicate entries
/usr/local/bin/fgt_import_logs.sh

# call script that queries db, builds report and mails report
/usr/local/bin/fgt_logs_report.sh

# end
