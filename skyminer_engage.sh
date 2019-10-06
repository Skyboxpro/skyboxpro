#!/bin/bash

# Get MAC addresses of all Node and write to macs.txt
./findmacs.sh

#Get IP addresses of each node and write to ips.txt
./findip.sh

#Set up SSH keys between Manager and each secondary node
./sshkeys.sh

#Send Manager Mac address to all secondary nodes
./manmac.sh

#Enable startmanager.service and startsecond.service on the Manager and seocndary nodes respectively
./enableboot.sh

#StartManager Interface and manager node
sudo systemctl start manager

#Reboot all secondary nodes. Sky wire will start after reboot
./rebootsecond.sh
