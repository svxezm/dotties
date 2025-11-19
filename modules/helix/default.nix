{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = fromTOML (builtins.readFile ../../config/helix/config.toml);
    languages = fromTOML (builtins.readFile ../../config/helix/languages.toml);

    ignores = [
      "node_modules/"
      "target/"
      "!.*"
    ];
  };
}
