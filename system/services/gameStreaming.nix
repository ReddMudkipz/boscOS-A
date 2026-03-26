{ config, pkgs, ... }:

{
  imports =
    [
      ../programs/steam.nix
    ];

  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPortRanges = [
      { from = 47998; to = 48000; }
      { from = 8000; to = 8010; }
    ];
  };

}
