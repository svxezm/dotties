{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "liz";
  home.homeDirectory = "/home/liz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "${home.homeDirectory}/.config/oh-my-zsh-custom/themes/sobole.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "sobolevn";
        repo = "sobole-zsh-theme";
        rev = "master";
        sha256 = "1182r2a2pa41aypcz1r9z1hvmqpqdfgpipny9jd5v19q1qvz20bs";
      } + "/sobole.zsh-theme";

    "${home.homeDirectory}/.config/oh-my-zsh-custom/themes/bubblegum.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "oddhorse";
        repo = "bubblegum-zsh";
        rev = "main";
        sha256 = "06c7yvi7bvsh401hfnr02nbpciva4hfqkbvxik6n2ra2nq1gmgma";
      } + "/bubblegum.zsh-theme";
  };

  nixpkgs.config.allowUnfree = true;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/liz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
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
      custom = "${config.home.homeDirectory}/.config/oh-my-zsh-custom";
    };
  };
}
