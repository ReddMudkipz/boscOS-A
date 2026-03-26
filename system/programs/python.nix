{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true; # for ZMK
  
  environment.systemPackages = with pkgs; [
    (python3.withPackages(python-pkgs: with python-pkgs; [
      pip
      opencv4
      pytest
      isort
      setuptools
      pymediainfo
      sqlite
      pandas
    ]))
    uv # for ZMK
  ];
}
