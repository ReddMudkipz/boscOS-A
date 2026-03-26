{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stash
  ];
}
