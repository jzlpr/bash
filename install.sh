#!/usr/bin/env bash

# Array of programs to install
program=(
    "vim" 
    "git" 
    "tldr" 
    "eza"
)

# Uppdatera repositories
sudo apt-get update

# Clear screen
clear

# Loop the array and install packages
for p in "${program[@]}"; do
    echo "Installing $p..."
    sudo apt-get install -y "$p"
    if [ $? -eq 0 ]; then
        echo "$p installed"
    else
        echo "Error installing $p"
    fi
done

echo "Installation completed successfully!"
