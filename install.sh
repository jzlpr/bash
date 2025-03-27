#!/usr/bin/env bash

# Array med program som ska installeras
program=(
    "vim" 
    "git" 
    "tldr" 
    "eza"
)

# Uppdatera paketlistan först
sudo apt-get update

# Loopa igenom arrayen och installera varje program
for p in "${program[@]}"; do
    echo "Installerar $p..."
    sudo apt-get install -y "$p"
    if [ $? -eq 0 ]; then
        echo "$p installerat"
    else
        echo "Fel vid installation av $p"
    fi
done

echo "Installation av program klar!"
