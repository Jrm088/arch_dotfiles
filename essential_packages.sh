#!/bin/bash

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo "Don't run this as root, sudo is called in the script"
   exit 1
fi

# Update system first
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install packages
echo "Installing essential packages..."
sudo pacman -S --noconfirm \
  xorg-server xorg-xinit \
  pipewire pipewire-pulse pipewire-alsa wireplumber \
  bluez bluez-utils bluez-deprecated-tools \
  i3 polybar rofi dunst picom libxcomposite libxdamage feh \
  kitty starship \
  ranger tree \
  mpv cmus sxiv yt-dlp \
  curl wget w3m \
  fastfetch which tmux unzip man-db man-pages \
  ttf-hack-nerd timeshift vivaldi

echo "Package installation complete!"
