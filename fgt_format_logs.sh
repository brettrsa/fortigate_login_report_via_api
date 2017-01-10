#!/bin/bash
#
# format raw log and prepare for db import
#
# start
#

# declare variables
raw=/var/data/raw_log
fmt=/var/data/format
raw_dir=/var/data/raw_archive
fmt_dir=/var/data/fmt_archive
timestamp=$( date +%d-%m-%Y )

# format the raw log
egrep '"tunnel-up"|tunnel-down"' $raw|egrep '"ssl-tunnel"'| awk '{print $1,$2,$12,$15,$17}'|sed 's/"//g'|sed 's/=/ /g'| awk '{print $2,$4,$6,$8,$10}' >> $fmt

# copy and remove from or to relevant directories
cp $fmt $fmt-$timestamp
cp $fmt-$timestamp $fmt_dir
rm $fmt-$timestamp

cp $raw $raw-$timestamp
cp $raw-$timestamp $raw_dir
rm $raw $raw-$timestamp

# end
