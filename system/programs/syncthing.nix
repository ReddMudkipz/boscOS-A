{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "reddmudkipz";
    dataDir = "/home/reddmudkipz";
    configDir = "/home/reddmudkipz/.config/syncthing";
  };

  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
