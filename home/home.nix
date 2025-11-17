{ config, pkgs, ... }:

let
  configHome = config.xdg.configHome;
in
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
    clang-tools
    cppcheck
    libllvm
    gnumake
    cmake
    bear
    apacheHttpd
    zig

    # language servers
    rust-analyzer
    lldb
    typescript-language-server
    vscode-langservers-extracted
    intelephense
    nil
    nixd
    zls
  ];

  home.file = {
    ".config/i3/config".source = ../config/i3/config;
    ".config/i3/search.sh".source = ../config/i3/search.sh;
    ".config/i3status/i3status.conf".source = ../config/i3status/i3status.conf;
    ".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;
    ".config/helix/config.toml".source = ../config/helix/config.toml;
    ".config/helix/languages.toml".source = ../config/helix/languages.toml;
    ".tmux.conf".source = ../config/tmux/.tmux.conf;

    "${configHome}/oh-my-zsh-custom/themes/sobole.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "sobolevn";
        repo = "sobole-zsh-theme";
        rev = "master";
        sha256 = "1182r2a2pa41aypcz1r9z1hvmqpqdfgpipny9jd5v19q1qvz20bs";
      } + "/sobole.zsh-theme";
    "${configHome}/oh-my-zsh-custom/themes/bubblegum.zsh-theme".source =
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
      sysflake = "sx /etc/nixos/flake.nix";
      dotflake = "sx ~/dotties/flake.nix";

      nixrb = "cd /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos && sudo nix flake update";
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
