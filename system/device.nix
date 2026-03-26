{ config, pkgs, ... }:
{
  imports = [
    ../devices/boscOS.nix
  ];

  networking.hostName = "boscOS";
}
