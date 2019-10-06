#!/bin/bash
#Discovery Address Update

curl -o startmanager.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startmanager.sh
curl -o startsecond.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startsecond.sh
curl -o skywire_update.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/skywire_update.sh


cd
chmod 777 startmanager.sh
chmod 777 startsecond.sh
chmod 777 skywire_update.sh

cd
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
  scp /home/pi/startsecond.sh $ip:/home/pi
  scp /home/pi/skywire_update.sh $ip:/home/pi

done < "$iplist"

./skywire_update.sh

sudo reboot
