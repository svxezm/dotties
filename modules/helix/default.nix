{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = import ./config.nix;
    languages = import ./languages.nix;

    ignores = [
      "node_modules/"
      "target/"
      "!.*"
    ];
  };
}
