{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = (builtins.readFile ./config.nix);
    languages = (builtins.readFile ./languages.nix);

    ignores = [
      "node_modules/"
      "target/"
      "!.*"
    ];
  };
}
