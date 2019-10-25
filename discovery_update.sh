#!/bin/bash
#Discovery Address Update

rm startmanager.sh
rm startsecond.sh


echo ""
echo ""***** Updating Node IP Addresses  *****"
echo "------------------------------------------------------"
echo ""

bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/findip.sh)


echo ""
echo "*****  Downloading new Discovery Address to the Manager Node  *****"
echo "------------------------------------------------------"
echo ""

curl -o startmanager.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startmanager.sh
curl -o startsecond.sh https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/startsecond.sh

cd
sudo chmod 777 startmanager.sh
sudo chmod 777 startsecond.sh

echo ""
echo "*****  Transferring new Discovery Address to all secondary nodes  *****"
echo "------------------------------------------------------"
echo ""

cd
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
  scp /home/pi/startsecond.sh $ip:/home/pi
done < "$iplist"


bash <(curl -sL https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/skywire_update.sh)
