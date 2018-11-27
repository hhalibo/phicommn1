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
sudo apt install sudo net-tools -y;
sudo apt autoremove;
sudo nano /etc/sudoers;
sudo dpkg-reconfigure tzdata;
reboot
