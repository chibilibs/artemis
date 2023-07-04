{ inputs, pkgs, ... }:
let
  ccStdenv = with pkgs.llvmPackages_16; [
    stdenv
    llvm
    clang
    pkgs.clang-tools
    libcxx
    libcxxabi
  ];
in {
  home.username = "chibilibs";
  home.homeDirectory = "/home/chibilibs";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  home.packages = [

    (pkgs.writeShellScriptBin "discordcanary" ''
      exec ${pkgs.discord-canary}/bin/discordcanary --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')

    # utils
    pkgs.ffmpeg
    pkgs.p7zip
    pkgs.mpv
    pkgs.obs-studio
    pkgs.nixfmt
    pkgs.gnupg
    pkgs.unzip
    pkgs.htop

    # wayland stuff
    pkgs.swaybg
    pkgs.firefox-wayland
    pkgs.xwayland
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    pkgs.hyprpicker

    # editors
    pkgs.vscode
    pkgs.helix
    pkgs.jetbrains.idea-ultimate

    # lsp for helix
    pkgs.rust-analyzer
    pkgs.jdt-language-server
    pkgs.nil

    # Java stuff
    pkgs.jdk17
    pkgs.maven
    pkgs.gradle

    # gaming
    pkgs.steam
    pkgs.prismlauncher
    pkgs.protonup-qt
    pkgs.gamemode

    # music :catJAM:
    pkgs.spotify

    # fonts
    pkgs.iosevka
    pkgs.noto-fonts
    pkgs.noto-fonts-extra
    pkgs.noto-fonts-emoji
    pkgs.material-design-icons
    pkgs.fantasque-sans-mono
    pkgs.font-awesome
    (pkgs.nerdfonts.override {
      fonts = [ "Iosevka" "Hack" "FantasqueSansMono" ];
    })

  ] ++ ccStdenv;

  imports = [
    ./app/git.nix
    ./app/zsh.nix
    ./app/kitty.nix
    ./app/helix.nix

    ./wm/eww.nix
    ./wm/hyprland.nix

    ./style/gtk.nix
  ];

  fonts.fontconfig.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
}
