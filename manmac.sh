#!/bin/bash
#Distributes Manager mac to all nodes in ips.txt.

cd
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
    rsync ~/.profile $ip:/home/pi


done < "$iplist"
