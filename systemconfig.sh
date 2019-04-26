#!/bin/bash

echo
echo "MUST BE in ROOT，Running System Configurations"
echo

echo "stop serial-getty@ttyS0.service"
sudo systemctl stop serial-getty@ttyS0.service;
sudo systemctl daemon-reload;
sudo systemctl disable serial-getty@ttyS0.service;

echo "Run apt-update"
sudo cp /boot/dtb/BCM4345C0.hcd  /lib/firmware/brcm;
sudo apt update; 
sudo apt upgrade -y;
sudo apt install sudo net-tools zip default-libmysqlclient-dev network-manager -y;
sudo systemctl start NetworkManager.service;
sudo apt install bluetooth avahi-daemon python3-venv  python3-pip python3-dev libbluetooth-dev build-essential libssl-dev libffi-dev  python-dev libudev-dev -y;
sudo apt autoremove;
sudo nano /etc/sudoers;
sudo dpkg-reconfigure tzdata;
sudo nmtui-edit;
sudo nmtui
reboot
