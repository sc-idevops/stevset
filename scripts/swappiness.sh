#!/bin/sh
if [ $(id -u) -ne 0 ]
 then echo "Please run as root"
 exit 1
fi

if [ -z "$1" ]
then 
	echo "Please provide a number to set swappiness value!" && exit 2
else 
	sudo echo "vm.swappiness="$1 >> /etc/sysctl.conf
  sudo sysctl -p
fi

