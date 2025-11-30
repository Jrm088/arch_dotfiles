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
# NOTE: Don't create polybar directory - we're symlinking the entire directory
mkdir -p ~/.config/rofi
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/dunst

echo "Creating symlinks from dotfiles to config locations..."

# Bash
ln -sf ~/arch_dotfiles/bashrc ~/.bashrc

# i3
ln -sf ~/arch_dotfiles/i3/config ~/.config/i3/config

# Kitty
ln -sf ~/arch_dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Picom
ln -sf ~/arch_dotfiles/picom/picom.conf ~/.config/picom/picom.conf

# Polybar - symlink entire directory (don't mkdir first!)
ln -sf ~/arch_dotfiles/polybar ~/.config/polybar

# Rofi
ln -sf ~/arch_dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/arch_dotfiles/rofi/android_notification.rasi ~/.config/rofi/android_notification.rasi

# Dunst
ln -sf ~/arch_dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

# Starship
ln -sf ~/arch_dotfiles/starship/starship.toml ~/.config/starship.toml

# Fastfetch
ln -sf ~/arch_dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

# Vim - symlink entire directory + vimrc
ln -sf ~/arch_dotfiles/vim ~/.vim
ln -sf ~/arch_dotfiles/vim/vimrc ~/.vimrc

echo "Symlinks created successfully!"
echo "Your dotfiles are now linked and ready to use!"
