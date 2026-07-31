#!/bin/bash

# Populating home directory
rm ~/.bashrc
rm ~/.zshrc
rm ~/.xbindkeysrc
rm ~/.xinitrc
cd ~/.dotfiles
stow .
rm -rf ~/.config/dunst
stow dunst
rm -rf ~/.config/picom
stow picom
rm -rf ~/.config/kitty
stow kitty
rm -rf ~/.config/yazi
stow yazi
rm ~/.config/starship.toml
stow starship
