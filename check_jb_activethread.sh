#!/bin/sh
conns=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.system:type=ServerInfo -a ActiveThreadCount -w $2 -c $3 | awk '{print $9}'| awk -F"|" '{ print $1}'`

perfdata="activeThread=$conns"

if [ $conns -lt $3 ] && [ $conns -gt 0 ];then

echo "OK | $perfdata"
exit 0

elif [ $conns -gt $3 ]; then

echo  "CRITICAL | $perfdata"
exit 2

else
echo "UNKNOWN | $perfdata"
exit 3
fi

