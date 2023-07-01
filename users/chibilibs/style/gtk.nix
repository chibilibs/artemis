{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

  };
}
