#!/bin/bash

# Quick script to handle automatic powerdown on battery power

BATTINFO=`acpi -b`
CRITICAL_PERCENTAGE=21
FILE_LOCATION="/root/LOW_BATTERY"

echo $BATTINFO
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -c 25-26 ` -lt $CRITICAL_PERCENTAGE ]]
then
echo `date` >> $FILE_LOCATION 
echo "Powered down due to battery status">>$FILE_LOCATION       
echo $BATTINFO >> $FILE_LOCATION
echo "##########"
/usr/sbin/shutdown -h now
fi
