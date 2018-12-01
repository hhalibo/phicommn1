#!/bin/bash

echo
echo "Autobackup write script for Hassbian"
echo

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
