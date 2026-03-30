#!/bin/bash

# Populating home directory
rm ~/.bashrc
rm ~/.xbindkeysrc
rm ~/.xinitrc
cd ~/.dotfiles
stow .
rm -rf ~/.config/dunst
stow dunst
stow picom
