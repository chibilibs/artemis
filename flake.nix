{
  description = "rapaz ele ta sem zap";
  # to sem zap

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        artemis = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./nixos/configuration.nix ];
        };
      };

      homeConfigurations = {
        chibilibs = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules =
            [ nixvim.homeManagerModules.nixvim ./users/chibilibs/home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
