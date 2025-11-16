{
  description = "Liz's NixOS and home-manager flake";

  # source information
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # information about that the flake should do with the inputs
  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    hmPath = ./home/home.nix;
  in {
    # home-manager module to system flake
    homeModules.liz = {
      imports = [ hmPath ];
    };

    # nixos module to system flake
    nixosModules.system = {
      imports = [
        ./system/configuration.nix
        ./system/hardware-configuration.nix
      ];
    };

    # home-manager configuration
    homeConfigurations = {
      liz = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ hmPath ];
      };
    };
  };
}
