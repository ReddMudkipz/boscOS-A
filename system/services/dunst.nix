{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dunst # notification daemon
    libnotify
  ];
}
