{ config, pkgs, ... }:

{
  # Enable lightdm
  services.xserver = {
    enable = true;
    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "reddmudkipz";
      extraConfig = ''
        [greeter]
          show-password-label = true
          password-alignment = center
          password-label-text = PASSWORD:

        [greeter-theme]
          font = "Cantarell Light"
          font-size = 12px
          text-color = "#F8F8F0"
          background-image = ""
          background-color = "#000000"
          window-color = "#000000"
          border-color = "#800020"
          layout-space = 15
          password-background-color = "#000000"
          password-border-width = 0px
      '';
    };
  };

  services.displayManager.defaultSession = "none+dwm"; #else "steam" might be chosen
}
