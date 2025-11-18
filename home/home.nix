{ config, pkgs, ... }:

let
  configHome = config.xdg.configHome;
in
{
  imports = [
    ../modules/zsh
    ../modules/tmux
    ../modules/helix
  ];

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
    emacs
    emacsPackages.meow
    emacsPackages.lsp-mode
    emacsPackages.ef-themes

    discord
    spotify
    steam
    steam-run
    vlc
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

  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk.cursorTheme = {
    name = "rose-pine-dawn";
    package = pkgs.rose-pine-cursor;
  };

  home.file = {
    ".config/i3/config".source = ../config/i3/config;
    ".config/i3/search.sh".source = ../config/i3/search.sh;
    ".config/i3status/i3status.conf".source = ../config/i3status/i3status.conf;
    ".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;

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
}
