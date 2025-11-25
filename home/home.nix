{ config, pkgs, ... }:

let
  configHome = config.xdg.configHome;
in
{
  imports = [
    ../modules/zsh
    ../modules/tmux
    ../modules/helix
    ../modules/kitty
    ../modules/i3
    ../modules/obs
  ];

  home.username = "liz";
  home.homeDirectory = "/home/liz";

  home.stateVersion = "25.05";

  xdg.enable = true;

  home.packages = with pkgs; [
    # cli
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

    # gui
    librewolf
    discord
    spotify
    steam
    steam-run
    vlc
    mpv
    krita
    obsidian

    # compilers
    rustc
    cargo
    rustfmt
    clippy
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
    vue-language-server
    intelephense
    nil
    nixd
    zls
    superhtml
    emmet-ls
    bash-language-server
    neocmakelsp
    cmake-language-server
    gopls
    neocmakelsp
    delve
    asm-lsp
    omnisharp-roslyn
    ty
    ruff
    python313Packages.jedi
    python313Packages.python-lsp-server

    # extra
    openssl
    pkg-config
    cargo-watch
    cargo-edit
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

  programs.home-manager.enable = true;
}
