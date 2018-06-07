#!/bin/bash

freemem=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.system:type=ServerInfo -a FreeMemory -w $2 -c $3 | awk '{print $9}'| awk -F"|" '{ print $1}'`


totalmem=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.system:type=ServerInfo -a TotalMemory -w $2 -c $3 | awk '{print $9}'| awk -F"|" '{ print $1}'`


maxmem=`/usr/local/nagios/libexec/check_mbean_collector -H $1 -p 5566 -m jboss.system:type=ServerInfo -a MaxMemory -w $2 -c $3 | awk '{print $9}'| awk -F"|" '{ print $1}'`


usedmem=`expr $totalmem - $freemem`


perc_used_mem=$(printf '%i %i' $usedmem $maxmem | awk '{ pc=100*$1/$2; i=int(pc); print (pc-i<0.5)?i:i+1 }')

perfdata="'Percentage of Used Memory'=${perc_used_mem} 'Total Memory'=${totalmem} 'Maximum Memory'=${maxmem} 'Used Memory'=${usedmem}"

if [ $perc_used_mem -le $2 ]  && [ $perc_used_mem -ge 0 ] ; then

echo "OK- Used memory is $usedmem , MaxMemory is $maxmem , Total Memory is $totalmem , FreeMem is $freemem , Percentage of used mem is  $perc_used_mem | ${perfdata}"

exit 0

elif  [ $perc_used_mem -gt $2 ] && [ $perc_used_mem -lt $3 ] ; then

echo "WARNING- Used memory is $usedmem , MaxMemory is $maxmem , Total Memory is $totalmem , FreeMem is $freemem , Percentage of used mem is  $perc_used_mem  | ${perfdata}"

exit 1
else 

echo "CRITICAL- Used memory is $usedmem , MaxMemory is $maxmem , Total Memory is $totalmem , FreeMem is $freemem , Percentage of used mem is  $perc_used_mem | ${perfdata}"

exit 2
fi
