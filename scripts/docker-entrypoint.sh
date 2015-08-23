#!/bin/bash

# Launch config script
/docker-configuration.sh

# Launching service
/usr/sbin/sshd -D
