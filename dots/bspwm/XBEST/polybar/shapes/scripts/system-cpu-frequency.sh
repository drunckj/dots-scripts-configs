#!/bin/bash
AVG=0
for i in {0..7}
do 
var=$(cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_cur_freq)
AVG=$(( $AVG + $var ))
done
a=`echo "scale=2; $AVG/8000000" | bc` && echo " $a Ghz "