{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xbindkeys # Launch shell commands with your keyboard or your mouse
    xbindkeys-config # GUI for configuring xbindkeys
    xorg.xev # Prints key presses
    xdotool # Simulate keyboard input and mouse activity
    xautomation # for xte for huge configuration
  ];
}
