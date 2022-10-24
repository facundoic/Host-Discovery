#!/bin/bash

network=$1

if [ $# -eq 0 ]; then
	echo -e "You need to write the IP to discover hosts in the network.\n"
	echo -e "Use : $0 192.168.100"
	exit 1
elif [ $# -eq 1 ];then
	echo -e "Discovering hosts for the following network $1"
else 
	echo "You have to write only one argument"
	exit 1
fi

for i in $(seq 1 255);do
	ping -c 1 $network.$i &>/dev/null

	if [ $? -eq 0 ];then
		echo -e "Host $network.$i is up"
	fi
done
