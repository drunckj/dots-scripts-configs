#!/bin/bash
ping_check()
{
while :
do
    sudo ip neigh flush dev en0
    ping -c 3 1.1.1.1
    if [ $? -eq 0 ]
    then
        #sudo ip neighbour add 172.16.3.219 lladdr b4:c4:fc:80:00:64 dev wlo1 nud perm
        printf '\e[1;34m%-6s\e[m\n' "Internet is working"
        sleep 10
    elif [ $? -eq 1 ]
    then
        printf '\e[1;31m%-6s\e[m\n' "Internet is not working. Reconnecting."
        networksetup -setairportpower en0 off
        sleep 1
        networksetup -setairportpower en0 on
        sleep 10
        #sudo ip n flush all
        sudo ip neighbour add $(ip addr show en0  | grep "inet" | cut -b 7-16 | grep "172") lladdr $(ip addr show en0 | grep "ether" | cut -b 8-24) dev en0 nud perm

        #sudo ip n
        #sudo ip n flush all
        #sleep 10
    fi
    sleep 5
done
}
  mac="b4:c4:fc:80:00:64"
  mac_check=$(ip link show en0 | grep ether | cut -b 8-24)
  if [[ "$mac" == "$mac_check" ]]
  then
      echo "mac already set"
      ping_check
  else
      sudo ifconfig en0 ether B4:C4:FC:80:00:64
      networksetup -setairportpower en0 off
      sleep 1
      networksetup -setairportpower en0 on
      sleep 10
      ping_check
  fi
