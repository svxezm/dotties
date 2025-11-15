{
  description = "My dotfiles";

  # source information
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  # information about that the flake should do with the inputs
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosModules.system = {
          imports = [
          ./system/configuration.nix
          ./system/hardware-configuration.nix
        ];
      };
      homeModules.liz = {
        imports = [ ./home/home.nix ];
      };
    };
}
