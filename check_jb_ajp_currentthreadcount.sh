conns=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.web:type=ThreadPool,name=ajp-0.0.0.0-8009 -a currentThreadCount  -w $2 -c $3 | awk '{print $9}'| awk -F"|" '{ print $1}'`

perfdata="current threadCount=$conns"

if [ $conns -lt $3 ] && [ $conns -ge 0 ];then

echo "OK | $perfdata"
exit 0

elif [ $conns -gt $3 ]; then

echo  "CRITICAL | $perfdata"
exit 1

else
echo "UNKNOWN | $perfdata"

fi
