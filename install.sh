#!/usr/bin/env bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Array of programs to install
program=(
    "vim" 
    "git" 
    "tldr" 
    "exa"
    "batcat"
    "btop"
)

# Update
apt-get update

# Clear screen
clear

# Loop the array and install packages
for p in "${program[@]}"; do
    echo "Installing $p..."
    apt-get install -y "$p"
    if [ $? -eq 0 ]; then
        echo "$p installed"
    else
        echo "Error installing $p"
    fi
done

echo "Installation completed successfully!"
