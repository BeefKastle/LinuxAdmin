#!/bin/bash

#list failed logins
echo "Failed login attempts:"
echo "User    IP Address  Date  Time"
lastb | awk '!/btmp/ {if( $ -ne "" ) print $1, $3, $5, $6, $7}'
echo ""

#list logins between 3am and 9am
echo "Logins between 3 and 9 am:"
echo "User    IP Address  Date  Time"
last | grep pts | while read -r line
do
	echo $line | awk -v FS='[ :]' '{if($7 > 3 && $7 < 9) print $1, $3, $5, $6, $7":"$8 }'
done
