#!/bin/bash

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo "Don't run this as root"
   exit 1
fi

echo "Creating config directories..."

# Create config directories if they don't exist
mkdir -p ~/.config/i3
mkdir -p ~/.config/kitty
mkdir -p ~/.config/picom
mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/fastfetch

echo "Creating symlinks from dotfiles to config locations..."

# Create symlinks from dotfiles to config locations
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

echo "Symlinks created successfully!"
echo "Your dotfiles are now linked and ready to use!"

