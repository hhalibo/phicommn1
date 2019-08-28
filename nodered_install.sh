#!/bin/bash

echo
echo "Autobackup install script for Hassbian"
echo


echo "Running apt-get preparation"
sudo apt-get update

sudo apt-get install -y libavahi-compat-libdnssd-dev avahi-daemon libnss-mdns  

echo "Getting node.js setup source"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs git make g++ gcc

echo "Installing NODE-RED with npm"
sudo npm install -g --unsafe-perm node-red

echo "run NODE-RED,PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!"
sudo node-red
sleep 15


sudo cat >> /etc/systemd/system/nodered.service <<'EOF'
[Unit]
Description=Node Red
After=network.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/bin/node-red -s /home/pi/.node-red/settings.js -u home/pi/.node-red

[Install]
WantedBy=multi-user.target
EOF

echo "Making Node-Red boot Autostart"
sudo systemctl daemon-reload;
sudo systemctl enable nodered.service;
sudo systemctl start nodered.service;

sleep 15

echo "Installation done."
sudo systemctl stop nodered.service;
cd ~/.node-red

echo "Installation of Nodered components."
sudo npm install node-red-contrib-home-assistant-websocket;
sudo npm install node-red-node-email;
sudo npm install node-red-dashboard;
sudo npm install node-red-contrib-modbustcp;
sudo npm install node-red-contrib-pushbear;
sudo npm install node-red-contrib-moment;
sudo npm install node-red-contrib-geofence;
sudo npm install node-red-contrib-modbus;
sudo npm install node-red-contrib-simpletime;

echo "All Done.Restart Nodered!PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!PLEASE CTRL+C!"
sudo systemctl restart nodered.service

echo
echo "Installation done."
echo
