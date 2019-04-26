#!/bin/bash

echo
echo "node-red install script2 for Hassbian"
echo

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
sudo npm install node-red-contrib-simpletime;

echo "All Done.Restart PLS use 'sudo systemctl status nodered.service' to check"
sudo systemctl restart nodered.service

echo
echo "Installation done."
echo
