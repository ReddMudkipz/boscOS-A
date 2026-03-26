{ config, pkgs, ... }:

{
  imports = [
    ../system/programs/emacs.nix
    ../system/programs/steam.nix
    ../system/programs/thunar.nix
    ../system/programs/syncthing.nix
    ../system/programs/ranger.nix
    ../system/programs/python.nix
    ../system/programs/sql.nix
  ];

  programs.firefox.enable = true; # browser
  programs.thunderbird.enable = true; # mail client, rss reader, matrix client

  environment.systemPackages = with pkgs; [
    # Utilities
    wget # for getting files from internet for scripts, terminals, etc.
    git # for version control
    gh # github cli
    wmctrl # manage windows via cli
    dconf # for home-manager
    pciutils
    lshw
    gparted # disk partitioning tool
    file # Shows the type of files
    neofetch # for system specs

    # Default programs
    neovim # terminal text editor
    vlc # vlc media player
    qimgv # image viewer
    naps2 # for scanning documents
    bc # gnu bc, basic calculator
    flameshot # screenshot tool
    alacritty # terminal emulator
    killall # to end processes

    # Recommended programs
    bitwarden-desktop # password manager
    discord # voice and text chat
    teamspeak6-client # for voice chat
    libreoffice # linux alternative for microsoft office
    kdePackages.kolourpaint # linux alternative for microsoft paint
    copyq # clipboard manager

    # Optional
    anki # flashcard program
    inkscape # vector graphics editor
    gimp # image manipulation program
    hexchat # irc client
    stremio # media streaming centre
    audacity # sound editor 

    # Game development
    godot_4 # godot game engine
  ];
}
