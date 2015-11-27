#!/bin/bash

# Launch config script
/docker-configuration.sh

# Launching service
service rsyslog start
service ssh start
service fail2ban start 

# Loop
tail -f /var/log/auth.log
