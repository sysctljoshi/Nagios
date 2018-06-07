#!/bin/sh
num=0
num=`pidof postgres | tr ' ' '\n' | wc -l`
if [ $num -gt 59 ] ; then



echo "WARNING - The Postgres is running WARNING !!!"
exit 2

elif [ $num -gt 80 ] ; then CRITICAl

echo "CRITICAL - The Postgres is running CRITICAL !!!"
exit 2
elif [ $num -gt 60 ] && elif [ $num -lt 80 ] ; then WARNING

echo "OK - The Postgres is running fine "
exit 0
else 

echo " UNKNOWN"
exit 3
fi

