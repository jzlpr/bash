#!/usr/bin/env bash
#
# system-info.sh
#

# Safety flags for robustness
set -euo pipefail

# Check command availability
required_commands=("hostname" "uptime" "free" "df" "lscpu")
for cmd in "${required_commands[@]}"; do
  if ! command -v "$cmd" > /dev/null; then
    echo "Error: Required command '$cmd' is not available. Please install it and try again." >&2
    exit 1
  fi
done

# Gather system information
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
MEMORY=$(free -h 2>/dev/null || echo "Error: 'free' command failed.") # Fallback in case of command failure
DISK=$(df -h 2>/dev/null || echo "Error: 'df' command failed.")       # Fallback in case of command failure
CPU=$(lscpu 2>/dev/null || echo "Error: 'lscpu' command failed.")     # Fallback in case of command failure

# Generate the system information report
echo "System Information Report"
echo "========================="
echo "Hostname: $HOSTNAME"
echo "Uptime: $UPTIME"
echo
echo "Memory Usage:"
echo "$MEMORY"
echo
echo "Disk Usage:"
echo "$DISK"
echo
echo "========================="
echo "CPU Information:"
echo "$CPU"
