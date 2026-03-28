#!/bin/bash
# Install base packages

# Refresh mirror database
sudo pacman -Syy

# for xsession
yay -S htop xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xset

# basic programs
firefox alacritty dunst emacs stow

# fonts and slock compatibility
nerd-fonts ttf-ms-fonts ttf-fira-code xorg-fonts-misc xorg-mkfontscale xorg-mkfontdir

# For doom emacs
yay -S ttf-symbola fd npm discount nix nixfmt xclip maim python-isort python-pipenv python-nose python-pytest

# Populating home directory
rm ~/.bashrc
cd ~/.dotfiles
stow .
stow dunst

    # Compiling suckless softwar
cd ~/.dotfiles/dwm
sudo make install
cd ~/.dotfiles/dmenu
sudo make install
cd ~/.dotfiles/slock
sudo make install
cd ~/.dotfiles/slstatus
sudo make install

# For slock text error
xset +fp /usr/share/fonts/misc/

    # Additional packages
yay -S ranger thunar dolphin zathura vlc vlc-plugins-all qimgv bc flameshot bitwarden discord libreoffice-still kolourpaint copyq kvirc godot stremio

yay -S flatpak
