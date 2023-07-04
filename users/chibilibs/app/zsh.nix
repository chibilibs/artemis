{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    shellAliases = {
      runfactorio = ''nix-shell "$HOME/dev/nix/factorio/factorioRun.nix"'';
    };
  };
}
