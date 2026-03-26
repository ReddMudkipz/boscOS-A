{ config, pkgs, ... }:

{
  services.printing = {
    enable = true; # Enable CUPS to print documents
    drivers = with pkgs; [
      samsung-unified-linux-driver # Proprietary Samsung Drivers
      splix # Drivers for printers supporting SPL (Samsung Printer Language)
    ];
  };

  environment.systemPackages = with pkgs; [
    splix # CUPS driver for Samsung printers
    system-config-printer # GUI for to connect to backend printer service
  ];
}
