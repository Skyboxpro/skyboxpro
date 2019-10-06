
#!/bin/bash
LAN=$(ip r | grep default | awk '{print $3}'); LAN=$(echo $LAN | sed 's/[0-9]*$/*/')


grep -f <(sed "s/\ *//g;s/\t*//g;s/\n*//g;s/\r*//g" macs.txt) <(sudo nmap -sn "$LAN"| awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " "$3;}'|tr '[:upper:]' '[:lower:]')|awk '{print $1}' > ips.txt



