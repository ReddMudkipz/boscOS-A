{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger # terminal based file manager
    mediainfo # for mediainfo ranger plugin
    ffmpeg-full # to get metadata for video duration in ranger
  ];
}
