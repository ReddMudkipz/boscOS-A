{ config, pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    mysql-workbench # GUI MySQL
    sqlite
    sqlite-utils
    sqlitestudio
  ];
}
