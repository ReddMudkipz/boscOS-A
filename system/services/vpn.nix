{ config, pkgs, ... }:

{
  services.openvpn.servers = {
    homeVPN = {
      config = ''
        config /home/reddmudkipz/Documents/pia.ovpn
      '';
      autoStart = false;
    }; 
  };

  networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];
}
