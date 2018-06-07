sessions=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.web:type=Manager,path=/$2,host=localhost -a activeSessions -w $3 -c $4 | awk '{print $9}'| awk -F"|" '{ print $1}'`

perfdata="activeSessions=$sessions"

if [ $sessions -lt $4 ] && [ $sessions -ge 0 ];then

echo "OK | $perfdata"
exit 0

elif [ $sessions -gt $4 ]; then

echo  "CRITICAL | $perfdata"
exit 2

else
echo "UNKNOWN | $perfdata"
exit 3
fi

