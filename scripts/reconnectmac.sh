 #!/bin/bash
 
 reconnect(){
 while :
 do
     sudo ip n flush all
     ping -c 3 1.1.1.1
     if [ $? -eq 0 ]
     then
         #sudo ip n add 172.16.3.219 lladdr b4:c4:fc:80:00:64 dev wlo1 nud perm
         printf '\e[1;34m%-6s\e[m\n' "Internet is working"
         sleep 10
     elif [ $? -eq 1 ]
     then
         printf '\e[1;31m%-6s\e[m\n' "Internet is not working. Reconnecting."
         sudo ip link set dev wlo1 down
         sleep 1
         sudo ip link set dev wlo1 up
 
         #sudo ip n flush all
         #sudo ip n add $(ip addr show wlo1  | grep "inet" | cut -b 10-20 | grep "172") lladdr $(ip addr show wlo1 |   grep "ether" | cut -b 16-32) dev wlo1 nud perm
 
         #sudo ip n
         #sudo ip n flush all
         #sleep 10
     fi
     sleep 5
 done
 }
 mac="b4:c4:fc:80:00:64"
   mac_check=$(ip addr show wlo1 |  grep "ether" | cut -b 16-32)
   if [[ "$mac" == "$mac_check" ]]
   then
       echo "mac already set"
       reconnect
   else
       sudo ip link set dev wlo1 down
       sudo ip link set dev wlo1 address $mac
       sudo ip link set dev wlo1 up
       sleep 10
       reconnect
   fi
