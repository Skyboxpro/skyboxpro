#!/bin/bash

# Get MAC addresses of all Node and write to macs.txt
bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/findmacs.sh)

#Get IP addresses of each node and write to ips.txt
bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/findip.sh)

#Set up SSH keys between Manager and each secondary node
bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/sshkeys.sh)

#Send Manager Mac address to all secondary nodes
bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/manmac.sh)

#Reboot all secondary nodes. Skywire will start after reboot
bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/rebootsecond.sh)
