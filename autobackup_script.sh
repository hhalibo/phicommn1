#!/bin/bash

echo
echo "Autobackup write script for Hassbian"
echo

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run with sudo. Use \"sudo ${0} ${*}\"" 1>&2
   exit 1
fi

echo "Write to scripts.yaml "
sudo cat >> /home/homeassistant/.homeassistant/scripts.yaml <<'EOF'
autobackup:
  alias: 自动备份
  sequence:
    - service: shell_command.backup
EOF

echo "Write to configuration.yaml "
sudo cat >> /home/homeassistant/.homeassistant/configuration.yaml <<'EOF'
shell_command:
  backup: bash ~/autobackup.sh
EOF

echo
echo "DONE!"
echo
