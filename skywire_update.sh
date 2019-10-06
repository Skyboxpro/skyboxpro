#!/bin/bash

# Update Skywire on local node

cd
chmod 777 startmanager.sh
chmod 777 startsecond.sh
cd /home/pi/go/src/github.com/skycoin/skywire
git checkout master && git reset --hard && git clean -f -d
git pull https://github.com/skycoin/skywire.git
cd && go install ./...

echo "Rebooting now..."
sudo reboot
