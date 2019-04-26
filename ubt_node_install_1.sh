#!/bin/bash

echo
echo "Autobackup install script for Hassbian"
echo


echo "Running apt-get preparation"
sudo apt-get update

sudo apt-get install -y libavahi-compat-libdnssd-dev avahi-daemon libnss-mdns  

echo "Getting node.js setup source"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Installing NODE-RED with npm"
sudo npm install -g --unsafe-perm node-red

echo "PLS run NODE-RED,PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!"
