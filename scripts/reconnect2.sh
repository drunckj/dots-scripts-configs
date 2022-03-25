#!/bin/bash

 reconnect(){
 while :
 do
     sudo ip n flush all
	if nc -vz google.com 443 
	then
         #sudo ip n add 172.16.3.219 lladdr b4:c4:fc:80:00:64 dev wlo1 nud perm
         printf '\e[1;34m%-6s\e[m\n' "Internet is working"
         sleep 5
 else
         printf '\e[1;31m%-6s\e[m\n' "Internet is not working. Reconnecting."
         sudo ip link set dev wlo1 down
         sudo ip link set dev wlo1 up
	 sleep 3
         sudo ip n flush all
         sudo ip n add 172.16.0.1 lladdr 64:d1:54:82:27:6d dev wlo1 nud perm
#         sudo ip n add $(ip addr show wlo1  | grep "inet" | cut -d "/" -f 1 | cut -d " " -f 6) lladdr $(ip addr show wlo1 |   grep "ether" | cut -b 16-32) dev wlo1 nud perm

         #sudo ip n
         #sudo ip n flush all
         #sleep 10
     fi
 done
 }


#mac="b4:c4:fc:80:00:64"
#mac="80:ad:16:c3:f9:80"
#mac="9c:ad:97:57:a1:01"
#mac="06:3f:2c:38:00:5c"
#mac="b4:0e:de:96:d8:9a "
mac="2a:2b:c0:6e:6a:80"
   mac_check=$(ip addr show wlo1 |  grep "ether" | cut -b 16-32)
   if [[ "$mac" == "$mac_check" ]]
   then
       echo "mac already set"
       reconnect
   else
       sudo ip link set dev wlo1 down
       sudo ip link set dev wlo1 address $mac
       sudo ip link set dev wlo1 up
       reconnect
   fi
