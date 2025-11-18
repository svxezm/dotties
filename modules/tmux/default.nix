{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 5;
    historyLimit = 10000;
    keyMode = "vi";
    shortcut = "Space";
    terminal = "tmux-256color";
    extraConfig = builtins.readFile ../../config/tmux/.tmux.conf;
  };
}
