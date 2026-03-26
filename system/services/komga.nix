{ config, pkgs, ... }:

{
  services.komga = {
    enable = true;
    settings.server.port = 11319;
    openFirewall = true;
  };
  
  networking.firewall.allowedTCPPorts = [ 11319 ];
}
