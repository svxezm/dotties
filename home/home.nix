{ config, pkgs, ... }:

{
  home.username = "liz";
  home.homeDirectory = "/home/liz";

  home.stateVersion = "25.05";

  xdg.enable = true;

  home.packages = with pkgs; [
    fzf
    unzip
    zip
    speedtest-cli
    ranger
    ani-cli
    imagemagick
    bun
    yt-dlp
    flameshot
    redshift

    librewolf
    kitty
    tmux
    helix

    discord
    spotify
    whatsie
    steam
    steam-run
    mpv
    krita
    obs-studio
    obsidian

    cargo
    rustc
    gcc
    apacheHttpd
  ];

  home.file = {
    "${config.xdg.configHome}/oh-my-zsh-custom/themes/sobole.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "sobolevn";
        repo = "sobole-zsh-theme";
        rev = "master";
        sha256 = "1182r2a2pa41aypcz1r9z1hvmqpqdfgpipny9jd5v19q1qvz20bs";
      } + "/sobole.zsh-theme";

    "${config.xdg.configHome}/oh-my-zsh-custom/themes/bubblegum.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "oddhorse";
        repo = "bubblegum-zsh";
        rev = "main";
        sha256 = "06c7yvi7bvsh401hfnr02nbpciva4hfqkbvxik6n2ra2nq1gmgma";
      } + "/bubblegum.zsh-theme";
  };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      x = "hx";
      sx = "sudo -E hx";

      nixconf = "sx ~/dotties/system/configuration.nix";
      homeconf = "x ~/dotties/home/home.nix";
      # nixcopy = "sudo cp /etc/nixos/configuration.nix ~/dotties/config/nix/configuration.nix";
      # flakecopy = "sudo cp /etc/nixos/flake.nix ~/dotties/config/nix/flake.nix";
      # homecopy = "cp ~/.config/home-manager/home.nix ~/dotties/config/nix/home.nix";
      # copyall = "nixcopy && flakecopy && homecopy";
      nixrb = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      homerb = "home-manager switch --flake /etc/nixos#liz";
      cleangens = "sudo nix-collect-garbage -d";
      flakeconf = "sx /etc/nixos/flake.nix";
      genlist = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
      nixcg = "nix-collect-garbade";

      i3conf = "x ~/.config/i3/config";

      p = "/media/OS/codes/languages/rust/projects/pls/target/release/pls";
      calc = "/media/OS/utils/calc/target/release/calc";
      todo = "/media/OS/utils/todo/target/release/todo";
      currency = "/media/OS/utils/currency/target/release/currency";
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
