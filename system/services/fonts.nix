{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    fira-sans
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues nerd-fonts); # install all nerd-fonts
}
