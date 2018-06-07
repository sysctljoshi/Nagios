#!/bin/sh
res=`sudo -u barman /usr/local/nagios/libexec/check-barman-master/check-barman.rb -a failed_backups -s labsdb -w 10 -c 20  | awk '{print $1}'`
echo $res
if [ $res = "\"0" ]; then
echo "No Backup Failed !!"
exit 0
else
echo "Barman Backup is failed !!"
exit 3
fi
