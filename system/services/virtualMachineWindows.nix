{ config, pkgs, ... }:

{
  # VirtualBox
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };

  virtualisation.virtualbox.guest = {
    enable = true;
  };

  users.extraGroups.vboxusers.members = [ "reddmudkipz"];
  
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  # Virt-manager
  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;
}
