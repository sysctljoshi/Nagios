#!/bin/sh
res=`sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a ssh -s labsdb  | awk '{print $3}'`
echo $res
if [ $res = ok ]; then
echo "Postgres SSH Connection is OK"
exit 0
else
echo "Postgres SSH connection is failed"
exit 3
fi
