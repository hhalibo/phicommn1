#!/bin/bash

echo
echo "Install seafile-cli script for Hassbian"
echo

sudo add-apt-repository ppa:seafile/seafile-client -y
sudo apt-get update
sudo apt-get install zip
sudo apt-get install seafile-cli -y

sudo cat >> /etc/systemd/system/seaf-cli.service <<'EOF'
[Unit]
Description=Seafile client
# Uncomment the next line you are running seafile client on the same computer as server
# After=seafile.service
# Or the next one in other case
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/seaf-cli start
ExecStop=/usr/bin/seaf-cli stop
RemainAfterExit=yes
User=homeassistant
Group=homeassistant

[Install]
WantedBy=multi-user.target
EOF

echo
echo "Preinstall seafile-cli DONE!"
echo
