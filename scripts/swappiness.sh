#!/bin/sh
if [ $1 -n]
then 
	echo "Please provide a number to set swappiness value!" && exit 1
else 
	echo "vm.swappiness="$1
fi

