#!/bin/bash	
# Autostart script to run Skywire on Secondary node	


sleep 30	

MANIP=$(sudo arp-scan --interface=eth0 --localnet | grep -F "$MACADD" | awk '{print $1}')	


cd /home/pi/go/bin 	
nohup ./skywire-node -connect-manager -manager-address "$MANIP":5998 -manager-web "$MANIP":8000 -discovery-address testnet.skywire.skycoin.com:5999-028ec969bdeb92a1991bb19c948645ac8150468a6919113061899051409de3f243 -address :5000 -web-port :6001 > /dev/null 2>&1 &
