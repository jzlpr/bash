#!/usr/bin/env bash
#
# system-info.sh
#

HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
MEMORY=$(free -h)
DISK=$(df -h)
CPU=$(lscpu)

echo "System Information Report"
echo "========================="
echo "Hostname: $HOSTNAME"
echo "Uptime: $UPTIME"
echo "Memory Usage:"
echo "$MEMORY"
echo "Disk Usage:"
echo "$DISK"
echo "========================="
echo "CPU Information:"
echo "$CPU"
