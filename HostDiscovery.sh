#!/bin/bash

network=$1

echo -e "\n[E] Enumerating the network $network \n"

for i in $(seq 1 255);do
	timeout 1 bash -c "ping -c 1 $network.$i" &>/dev/null && echo -e "\t[*]Host discovered : $network.$i" &
done; wait
