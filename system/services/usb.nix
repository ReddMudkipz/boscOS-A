{ config, pkgs, ... }:

{
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    udisks
    udiskie
    ntfs3g # for ntfsfix command
  ];
}
