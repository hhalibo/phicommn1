#!/bin/bash
sudo mkdir /home/homeassistant/.homeassistant/gitclone;
sudo mkdir /home/homeassistant/.homeassistant/custom_components;
sudo git clone https://github.com/rgruebel/ha_zigbee2mqtt_networkmap.git  /home/homeassistant/.homeassistant/gitclone;
sleep 10;
sudo cp -r /home/homeassistant/.homeassistant/gitclone/custom_components/zigbee2mqtt_networkmap/ /home/homeassistant/.homeassistant/custom_components/;
sudo cp -r /home/homeassistant/.homeassistant/custom_components/zigbee2mqtt_networkmap/www  /home/homeassistant/.homeassistant/;
sudo chown -R homeassistant:homeassistant /home/homeassistant/.homeassistant/custom_components;
sudo chown -R homeassistant:homeassistant /home/homeassistant/.homeassistant/www;
sudo cp /home/homeassistant/.homeassistant/configuration.yaml  /home/homeassistant/.homeassistant/configuration.yaml.bak
sudo cat >> /home/homeassistant/.homeassistant/configuration.yaml <<'EOF'
#Zigbee设备mesh网络地图
webhook:
zigbee2mqtt_networkmap:
  topic: zigbee2mqtt
panel_iframe:
  networkmap:
    title: 'Zigbee Map'
    url: '/local/community/zigbee2mqtt_networkmap/map.html'
    icon: 'mdi:graphql'
EOF
sudo clear;
