#!/bin/bash

echo
echo "Docker install script for Hassbian"
echo

echo "Running apt-get preparation"
sudo apt-get update

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "add the GPG key for the official Docker repository to your system"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Add the Docker repository to APT sources"
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu bionic stable"

echo "Redo apt update"
sudo apt update
sudo apt install -y avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev g++ gcc jq socat

echo "Make sure you are about to install from the Docker repo instead of the default Ubuntu repo"
apt-cache policy docker-ce

sleep 5

echo "Install Docker now"
sudo apt install docker-ce -y

echo
echo "Installation done."
echo
