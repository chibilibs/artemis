{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      runfactorio = ''nix-shell "$HOME/dev/nix/factorio/factorioRun.nix"'';
    };
  };
}
