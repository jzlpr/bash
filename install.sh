#!/usr/bin/env bash
#
# install.sh
#

# Safety flags to improve robustness
set -euo pipefail

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script as root." >&2
  exit 1
fi

# Check command availability
required_commands=("apt-get" "clear")
for cmd in "${required_commands[@]}"; do
  if ! command -v "$cmd" > /dev/null; then
    echo "Error: Required command '$cmd' is not available. Please install it and try again." >&2
    exit 1
  fi
done

# Array of programs to install
program=(
  "vim"
  "git"
  "tldr"
  "exa"
  "bat"
  "btop"
)

# Update system package index
echo "Updating package list..."
apt-get update -y

# Clear screen
clear

# Install each program in the array
for p in "${program[@]}"; do
  echo "Installing $p..."
  if apt-get install -y "$p"; then
    echo "$p installed successfully."
  else
    echo "Error: Failed to install $p." >&2
  fi
done

# Display completion message
echo "Installation process completed!"
