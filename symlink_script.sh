#!/bin/bash

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo "Don't run this as root"
   exit 1
fi

echo "Creating dotfiles directory structure..."

# Create main dotfiles directory
mkdir -p ~/dotfiles

# Create subdirectories
mkdir -p ~/dotfiles/fastfetch
mkdir -p ~/dotfiles/i3
mkdir -p ~/dotfiles/kitty
mkdir -p ~/dotfiles/picom
mkdir -p ~/dotfiles/polybar
mkdir -p ~/dotfiles/rofi
mkdir -p ~/dotfiles/starship
mkdir -p ~/dotfiles/vim
mkdir -p ~/dotfiles/wallpapers

echo "Moving config files to dotfiles..."

# Move config files to dotfiles (backup originals)
mv ~/.config/i3/config ~/dotfiles/i3/
mv ~/.config/kitty/kitty.conf ~/dotfiles/kitty/
mv ~/.config/picom/picom.conf ~/dotfiles/picom/
mv ~/.config/polybar/config.ini ~/dotfiles/polybar/
mv ~/.config/rofi/config.rasi ~/dotfiles/rofi/
mv ~/.config/starship.toml ~/dotfiles/starship/
mv ~/.vimrc ~/dotfiles/vim/
mv ~/.config/fastfetch/config.jsonc ~/dotfiles/fastfetch/

echo "Creating symlinks..."

# Create symlinks from dotfiles back to config locations
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

echo "Symlinks created successfully!"
