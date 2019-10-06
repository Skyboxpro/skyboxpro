#!/bin/bash
#Discovery Address Update

rm startmanager.sh
rm startsecond.sh

curl -o startmanager.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startmanager.sh
curl -o startsecond.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startsecond.sh

cd
sudo chmod 777 startmanager.sh
sudo chmod 777 startsecond.sh
sudo chmod 777 skywire_update.sh

cd
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
  scp /home/pi/startsecond.sh $ip:/home/pi
done < "$iplist"

./skywire_update.sh
