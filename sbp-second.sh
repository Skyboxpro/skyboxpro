#!/bin/bash

###Update Skybox Pro to use Skywire default autostart scripts
### SECONDARY NODE

##Progress bar :)
while true;do echo -n .;sleep 0.1;done &


#Download custom Skywire Defaults file with rpi go folder (From Skybox Git)
cd /home/pi/go/src/github.com/skycoin/skywire/static/script/
sudo rm /home/pi/go/src/github.com/skycoin/skywire/static/script/skywire.defaults &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/skywire.defaults &>/dev/null
sudo chmod 777 skywire.defaults
echo "Skywire Defaults file updated...100%"

#Update Skywire node-start service file - (download custom from Skybox git)
cd /home/pi/go/src/github.com/skycoin/skywire/static/script/
sudo rm /home/pi/go/src/github.com/skycoin/skywire/static/script/node_start &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/node_start &>/dev/null
sudo chmod 777 node_start
echo "Node autostart script updated (1/2)...100%"

#Update Skywire start service file - (download custom from Skybox git)
cd /home/pi/go/src/github.com/skycoin/skywire/static/script/
sudo rm /home/pi/go/src/github.com/skycoin/skywire/static/script/start &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/start &>/dev/null
sudo chmod 777 start
echo "Node autostart script updated (2/2)...100%"

#Update Skywire stop service file - (download custom from Skybox git)
cd /home/pi/go/src/github.com/skycoin/skywire/static/script/
sudo rm /home/pi/go/src/github.com/skycoin/skywire/static/script/stop &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/stop &>/dev/null
sudo chmod 777 stop
echo "Node stop script updated...100%"

#Update Skywire update service file - (download custom from Skybox git)
cd /home/pi/go/src/github.com/skycoin/skywire/static/script/
sudo rm /home/pi/go/src/github.com/skycoin/skywire/static/script/update &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/update &>/dev/null
sudo chmod 777 update
echo "Check Node Update script updated...100%"

#Create symbolic link to Skywire Defaults environment variables file
cd /etc/default/
sudo rm /etc/default/skywire &>/dev/null
sudo ln -s /home/pi/go/src/github.com/skycoin/skywire/static/script/skywire.defaults skywire &>/dev/null
echo "Symbolic Link to Skywire Script folder created...100%"

#Reload Defaults file
source /etc/default/skywire

#New Systemd unit file from Skybox github
cd /etc/systemd/system/
sudo rm /etc/systemd/system/skywire-node.service &>/dev/null
sudo wget https://raw.githubusercontent.com/Skyboxpro/skyboxpro/master/skywire-node.service &>/dev/null
echo "Systemd unit file updated...100%"

#Disable existing systemd services 
sudo systemctl disable manager &>/dev/null
sudo systemctl disable secondary &>/dev/null
echo "Disabled previous autostart scripts...100%"

#Enable systemd 
sudo systemctl daemon-reload &>/dev/null
sudo systemctl enable skywire-node.service &>/dev/null
echo "Enable new autostart scripts...100%"

kill $!; trap 'kill $!' SIGTERM
echo "Update Successful!!"
#Reboot to start service
echo "Rebooting now..."
sudo reboot
