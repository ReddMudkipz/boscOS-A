{ config, pkgs, ... }:

{
  imports = [
    ./python.nix
  ];

  # Start emacs daemon
  services.emacs.enable = true;

  environment.systemPackages = with pkgs; [
    emacs

    # For Doom install
    fd
    coreutils
    ripgrep
    libclang
    clang

    # For org-roam
    sqlite

    # For org-download-clipboard
    maim
    scrot
    gnome-screenshot
    xclip

    # Packages for Doom Modules
    nixfmt-classic
    shellcheck
    pandoc
    ((emacsPackagesFor emacs).emacsWithPackages (epkgs: with epkgs; [
      vterm
      treesit-grammars.with-all-grammars
      auctex
      sqlite3
    ]))
    zathura # for latex preview
    cmake
    gnumake
    libgcc
    libtool
    libvterm
    nodejs
    pipenv
    ispell
    texliveFull
    graphviz
  ];
}
