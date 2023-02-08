#!/bin/sh
if [ -f "/sys/class/hwmon/hwmon5/fan1_input" ]
then
speed=$(cat /sys/class/hwmon/hwmon5/fan1_input)
elif [ -f "/sys/class/hwmon/hwmon7/fan1_input" ]
then
	speed=$(cat /sys/class/hwmon/hwmon7/fan1_input)
else
	speed=$(cat /sys/class/hwmon/hwmon6/fan1_input)
fi
if [ "$speed" != "" ]; then
    speed_round=$(echo "$speed" | bc -l )
    echo "$speed_round RPM "
else
   echo "#"
fi
