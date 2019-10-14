
#!/bin/bash


sudo arp-scan --interface=eth0 --localnet | grep -F "Raspberry" | awk '{print $2}' > macs.txt
