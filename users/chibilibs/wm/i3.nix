{ lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    
    config = {
      terminal = "alacritty";

      window.titlebar = false;

      modifier = "Mod4";

      keybindings = lib.mkOptionDefault {};

      startup = [
        { command = "discordcanary"; }
      ];
    }; 
  }; 
}  
