PfSense install CRON plugin\
Navigate to the “add” tag and input the following\
###################################\
minute *\
hour *\
day of month *\
month of year *\
day of week *\
user root\
##############################\
command:\
/usr/sbin/arp -a > /root/arp.tmp && /usr/local/bin/curl -X POST -F 'data=@/root/arp.tmp' http://192.168.1.200:8123/api/pfsense \
##############################\
SAVE

add to configuration.yaml: \
  device_tracker: \
    - platform: pfsense

RESTART HASS
