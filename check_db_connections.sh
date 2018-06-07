#!/bin/sh
num=0
num=`pidof postgres | tr ' ' '\n' | wc -l`
if [ $num -gt 70 ]; then

echo "CRITICAL - $num of Postgres is running !! "
exit 2
elif [ $num -eq 0 ] ; then

echo "CRITICAL -  postgres is NOT running !!!"
exit 2
elif [ $num -lt 70 ] && [ $num -gt 1 ]; then

echo "OK - Only $num of postgres is running "
exit 0

else

echo " UNKNOWN"
exit 3
fi

