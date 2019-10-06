#!/bin/bash
# Create SSH key pairs on all nodes
#1 to 2, 3, 4,..n

#Create key on Primary Node
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -C "$HOSTNAME"

#Send public key to all Secondary Nodes in IP list
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
    ssh-copy-id $ip
done < "$iplist"
