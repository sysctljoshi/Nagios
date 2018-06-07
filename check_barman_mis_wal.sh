#!/bin/sh
res=`sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a missing_wals -s labsdb  | awk '{print $3}'`
echo $res
if [ $res = no ]; then
echo "There are no Missing WALS"
exit 0
else
echo "There are some MISSED Wals"
exit 3
fi
