#!/bin/bash
# Install base packages

# Refresh mirror database
sudo pacman -Syy

# for xsession
yay -S htop xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xset picom

# basic programs
yay -S firefox alacritty dunst emacs stow openssh

# fonts and slock compatibility
yay -S nerd-fonts ttf-ms-fonts ttf-fira-code xorg-fonts-misc xorg-mkfontscale xorg-mkfontdir

# For doom emacs
yay -S ttf-symbola fd npm discount nix nixfmt xclip maim python-lsp-server python-isort python-pipenv python-nose python-pytest shellcheck graphviz ispell ripgrep

# Audio
yay -S alsa pipewire pipewire-pulse alsa-utils playerctl pavucontrol

# Printing
yay -S cups
sudo systemctl enable cups.service

# Bluetooth
yay -S bluez bluez-utils bluetuith
sudo systemctl enable bluetooth.service

# USB storage devices
yay -S ntfs-3g udisks2 udiskie

# For global dark mode
yay -S gnome-themes-extra gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git
sudo rm /etc/environment
sudo ln -s ~/.dotfiles/etc/environment /etc

# For global dark mode
yay -S gnome-themes-extra gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git
sudo rm /etc/environment
sudo ln -s ~/.dotfiles/etc/environment /etc

# Populating home directory
rm ~/.bashrc
rm ~/.xbindkeysrc
rm ~/.xinitrc
cd ~/.dotfiles
stow .
rm -rf ~/.config/dunst
stow dunst
stow picom

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
yay -S ranger thunar zathura vlc vlc-plugins-all qimgv bc flameshot bitwarden discord libreoffice-still kolourpaint copyq kvirc godot github-cli xbindkeysrc xorg-xinput neofetch kdeconnect ffmpeg pipx
