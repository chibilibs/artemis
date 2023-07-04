{ pkgs, ... }:
let
in {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Gruvbox Dark";
    font = {
      name = "Fantasque Sans Mono";
      package = pkgs.fantasque-sans-mono;
      size = 10;
    };

    settings = { background_opacity = "0.5"; };
  };
}
