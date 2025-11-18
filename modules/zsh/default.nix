{ config, ... }:
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

      nixconf = "sx ~/dotties/system/configuration.nix";
      homeconf = "x ~/dotties/home/home.nix";
      sysflake = "sx /etc/nixos/flake.nix";
      dotflake = "sx ~/dotties/flake.nix";
      econf = "e ~/.config/emacs.d/config.el";

      nixrb = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      homerb = "nix run github:nix-community/home-manager -- switch --flake ~/dotties#liz && source ~/.zshrc";

      genlist = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
      cleangens = "sudo nix-collect-garbage -d";
      nixcg = "nix-collect-garbage";

      i3conf = "x ~/dotties/config/i3/config";

      p = "/media/OS/codes/languages/rust/projects/pls/target/release/pls";
      calc = "/media/OS/utils/calc/target/release/calc";
      todo = "/media/OS/utils/todo/target/release/todo";
      currency = "/media/OS/utils/currency/target/release/currency";
      search = "cd /media/OS/codes/languages/rust/projects/search && ./target/release/search";
      fact = "nix-instantiate --eval /media/OS/codes/languages/nix/factorial/factorial.nix --arg num";
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
