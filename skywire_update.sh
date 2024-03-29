#!/bin/bash

# Update Skywire on local node

echo ""
echo "*****  Updating Skywire Software to latest version  *****"
echo "------------------------------------------------------"
echo ""


cd /home/pi/go/src/github.com/skycoin/skywire
git checkout master && git reset --hard && git clean -f -d
git pull https://github.com/skycoin/skywire.git
cd $GOPATH/src/github.com/skycoin/skywire/cmd
go install ./...

echo "Rebooting now..."
sudo reboot
