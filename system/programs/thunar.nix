{ config, pkgs, ... }:

{
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-volman
    thunar-archive-plugin
  ];

  environment.systemPackages = with pkgs; [
    xfce.thunar # for executable
    xarchiver # for thunar-archive-plugin
    xfce.tumbler # for thunar image previews
  ];
}
