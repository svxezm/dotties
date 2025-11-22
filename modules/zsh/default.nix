{ config, ... }:
let
  utils = "~/utils";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      x = "hx";
      sx = "sudo -E hx";
      e = "emacs -nw";
      se = "sudo -E emacs -nw";

      ncf = "sx ~/dotties/system/configuration.nix";
      hcf = "x ~/dotties/home/home.nix -w ~/dotties";
      sfl = "sx /etc/nixos/flake.nix";
      dfl = "sx ~/dotties/flake.nix";
      econf = "e ~/.config/emacs.d/config.el";

      nrb = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      hrb = "nix run github:nix-community/home-manager -- switch --flake ~/dotties#liz && source ~/.zshrc";

      genlist = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
      cleangens = "sudo nix-collect-garbage -d";
      ncg = "nix-collect-garbage";

      i3c = "x ~/dotties/config/i3/config";
      zc = "x ~/dotties/modules/zsh/default.nix";

      p = "${utils}/pls";
      calc = "${utils}/calc";
      todo = "${utils}/todo";
      currency = "${utils}/currency";
      search = "${utils}/search";
    };
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "sobole";
      # theme = "bubblegum";
      custom = "${config.xdg.configHome}/oh-my-zsh-custom";
    };
  };
}
