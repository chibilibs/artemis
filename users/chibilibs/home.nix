{ pkgs, ... }:
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
    # dev.editors
    pkgs.jetbrains.idea-ultimate
    
    # dev.utils
    pkgs.nixfmt

    # dev.java
    pkgs.jdk17
    pkgs.maven
    pkgs.gradle

    # utils
    pkgs.ffmpeg
    pkgs.p7zip
    pkgs.mpv
    pkgs.unzip
    pkgs.htop
    pkgs.discord-canary
    pkgs.android-tools

    pkgs.fantasque-sans-mono
    (pkgs.nerdfonts.override {
      fonts = [ "Iosevka" "Hack" "FantasqueSansMono" ];
    })
  ] ++ ccStdenv;

  imports = [
    ./app/git.nix
    ./app/bash.nix

    ./app/nvim.nix

    ./app/kitty.nix

    ./wm/i3.nix
  ];

  fonts.fontconfig.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
}
