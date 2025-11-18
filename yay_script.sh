#!/bin/bash

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo "Don't run this as root"
   exit 1
fi

# Install yay if not already installed
if ! command -v yay &> /dev/null; then
    echo "Installing yay AUR helper..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
else
    echo "yay is already installed"
fi

# Install AUR packages
echo "Installing AUR packages..."
yay -S --noconfirm joplin-appimage

echo "AUR setup complete!"
