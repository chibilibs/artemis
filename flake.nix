{
  description = "rapaz ele ta sem zap";
  # to sem zap

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = { 
        artemis = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./nixos/configuration.nix ];
        };
      };

      homeConfigurations = {
        chibilibs = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            hyprland.homeManagerModules.default
            ./users/chibilibs/home.nix
          ];

          extraSpecialArgs = {inherit inputs;};
        }; 
      };
    };
}
