{
  description = "My dotfiles";

  # source information
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # information about that the flake should do with the inputs
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        liz = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home/home.nix ];
        };
      };
    };
}
