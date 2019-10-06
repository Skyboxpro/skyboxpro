#!/bin/bash
#Enables skywire.service on all nodes. Enabling will allow skywire to run on reboot.

cd
#PRIMARY NODE
sudo systemctl enable manager

#SECONDARY NODES
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do
	ssh $ip 'sudo systemctl enable secondary' &
done < "$iplist"

