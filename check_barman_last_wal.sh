#!/bin/sh
res=`sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a last_wal_received -s labsdb -w 1800 -c 1900 -s labsdb  | awk '{print $5}'`
sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a last_wal_received -s labsdb -w 1800 -c 1900 -s labsdb
stat=$?
echo $res $stat
if [ $stat -eq 0 ] && [ $res -lt 1800 ]; then
echo "Lat Wal Received was with in 30 minutes"
exit 0
else
echo "No WAL Rcvd with in 30 mminutes"
exit 3
fi
