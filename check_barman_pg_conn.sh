#!/bin/sh
res=`sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a pg -s labsdb  | awk '{print $3}'`
echo $res
if [ $res = ok ]; then
echo "Postgres PG Connection is OK"
exit 0
else
echo "Postgres PG connection is failed"
exit 3
fi
