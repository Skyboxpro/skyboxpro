#!/bin/bash

iplist="/home/pi/ips.txt"
while IFS= read -r ip
do
    ssh $ip sudo reboot &
done < "$iplist"
