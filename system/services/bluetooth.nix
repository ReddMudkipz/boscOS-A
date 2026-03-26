{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.enableAllFirmware = true; # to enable motherboard bluetooth

  # GUI bluetooth manager
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    bluetuith # bluetooth tui
  ];
}
