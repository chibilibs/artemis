{ lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    
    config = {
      terminal = "kitty";

      window.titlebar = false;

      gaps.inner = 2;
      gaps.outer = 2;

      modifier = "Mod4";

      keybindings = lib.mkOptionDefault {};

      startup = [
        { command = "discordcanary"; }
      ];
    }; 
  }; 
}  
