#!/bin/bash	
# Autostart script for Manager node	

#Start Manager	
cd /home/pi/go/bin	
nohup ./skywire-manager -web-dir /home/pi/go/src/github.com/skycoin/skywire/static/skywire-manager > /dev/null 2>&1 &	

#Start Primary Node	
cd /home/pi/go/bin	
nohup ./skywire-node -connect-manager -manager-address :5998 -manager-web :8000 -discovery-address testnet.skywire.skycoin.com:5999-028ec969bdeb92a1991bb19c948645ac8150468a6919113061899051409de3f243 -address :5000 -web-port :6001 > /dev/null 2>&1 &
