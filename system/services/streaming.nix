{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obs-studio # streaming software and screen recording
    qutebrowser # minimal browser only for streaming
    vim-full # to open config.py for qutebrowser
  ];
}
