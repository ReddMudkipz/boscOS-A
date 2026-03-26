#!/usr/bin/env sh

printf ">>> System rebuild: IN PROGRESS\n";
cd ~/.dotfiles;
cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix
printf "Copied hardware-configuration.nix\n"
cp /etc/nixos/device.nix ./system/device.nix
printf "Copied device.nix\n"
sudo nixos-rebuild switch --flake .;
printf ">>> System rebuild: DONE\n";
