#!/bin/bash

echo
echo "setup home-assistant install for Hassbian"
echo

sudo hassbian-config install homeassistant;
clear;
sudo chown -R homeassistant:homeassistant /srv/homeassistant;
sudo systemctl stop home-assistant@homeassistant.service;
sudo su -s /bin/bash homeassistant;
source /srv/homeassistant/bin/activate;
pip3 install broadlink PyXiaomiGateway;
hass
