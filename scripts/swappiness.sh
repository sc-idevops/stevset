#!/bin/bash
if [ -z "$1" ]
then 
  read -p 'swappiness value: ' sw
else 
  sw=$1
fi 
echo "vm.swappiness="$sw | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

