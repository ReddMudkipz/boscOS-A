{ config, pkgs, ... }:

{
  # Enabling SSH
  services.openssh = {
    enable = true;
    ports = [ 40592 ];
    settings = {
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  networking.firewall.allowedTCPPorts = [ 40592 ];
}
