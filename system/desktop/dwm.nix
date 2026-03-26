{ config, pkgs, fetchFromGitHub, ... }:

{
  imports =
    [
      #../displayManager/lightdm.nix
    ];

  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
  };

  # Enable slock
  programs.slock.enable = true;

  # Custom config
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = ../programs/suckless/dwm;
      });
      st = prev.st.overrideAttrs (old: {
        #src = ../programs/suckless/st ;});
        src = pkgs.fetchFromGitHub {
          owner = "LukeSmithxyz";
          repo = "st";
          rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
          sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
        };
        buildInputs = old.buildInputs ++ [ prev.harfbuzz ];
      });
      slstatus = prev.slstatus.overrideAttrs (old: { src = ../programs/suckless/slstatus ;});
      tabbed = prev.tabbed.overrideAttrs (old: { src = ../programs/suckless/tabbed ;});
      dmenu = prev.dmenu.overrideAttrs (old: { src = ../programs/suckless/dmenu ;});
      surf = prev.surf.overrideAttrs (old: { src = ../programs/suckless/surf ;});
      slock = prev.slock.overrideAttrs (old: {
        src = ../programs/suckless/slock;
        buildInputs = old.buildInputs ++ [ final.xorg.libXinerama ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    st # simple terminal
    dmenu # script runner. mainly app launcher
    surf # lightweight browser
    tabbed # allows tabbing. mainly for surf
    slstatus # status monitor

    # For media controls
    alsa-utils
    playerctl # for CLI commands for prev/next/play/pause

    # Looks
    nwg-look # gtk settings editor
    lxappearance # to configure thems and fonts for gtk applications
    xorg.xsetroot # to set black background to dwm

    # utilities
    xorg.xmodmap # to see what keys are mapped to the mods.
  ];
}
