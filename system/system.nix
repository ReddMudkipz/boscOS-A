{ config, lib, pkgs, ... }:

{
  imports = [
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Edmonton";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Keep hardware click in local time instead of UTC
  time.hardwareClockInLocalTime = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # CLI Power management
  services.upower = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # For KDE connect
  programs.kdeconnect.enable = true;

  # Tailscale for remote connections
  services.tailscale = {
    enable = true;
  };

  # Firewall
  networking.firewall = {
    enable = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reddmudkipz = {
    isNormalUser = true;
    description = "ReddMudkipz";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05"; # DO NOT CHANGE
}
