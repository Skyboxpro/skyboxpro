#!/bin/bash
#Discovery Address Update

cd
chmod 777 startmanager.sh
chmod 777 startsecond.sh
chmod 777 skywire_update.sh
cd /home/pi/go/src/github.com/skycoin/skywire
git checkout master && git reset --hard && git clean -f -d
git pull https://github.com/skycoin/skywire.git
cd && go install ./...



cd
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
  scp /home/pi/startsecond.sh $ip:/home/pi
  scp /home/pi/skywire_update.sh $ip:/home/pi

done < "$iplist"


echo "Rebooting now..."
sudo reboot
