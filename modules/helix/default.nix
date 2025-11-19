{ pkgs, ... }:
let
  std = import (builtins.fetchTarball {
    url = "https://github.com/chessai/nix-std/archive/v0.0.0.1.tar.gz";
    sha256 = "0vglyghzj19240flribyvngmv0fyqkxl8pxzyn0sxlci8whmc9fr";
  });
in
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # settings = fromTOML (builtins.readFile ../../config/helix/config.toml);
    # languages = fromTOML (builtins.readFile ../../config/helix/languages.toml);
    settings = import ./config.nix;
    languages = import ./languages.nix;

    ignores = [
      "node_modules/"
      "target/"
      "!.*"
    ];
  };
}
