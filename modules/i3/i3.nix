{ pkgs, ... }:
let
  mod = "Mod1";
  main1 = "#a26769";
  # main2 = "#d5b9b2";
  acct1 = "#bfb5af";
  acct2 = "#ece2d0";
  dark = "#582c4d";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      fonts = {
        names = [ "monospace" ];
        size = 8.0;
      };

      startup = [
        { command = "dex --autostart --environment i3"; notification = false; }
        { command = "xsetroot -cursor_name left_ptr"; always = true; notification = false; }
        { command = "xrdb -merge ~/.Xresources"; always = true; notification = false; }
        { command = "redshift -O 4000"; notification = false; }
        { command = "flameshot"; notification = false; }
        { command = "i3-msg 'workspace 1; exec spotify'"; notification = false; }
        { command = "i3-msg 'workspace 1; exec discord'"; notification = false; }
        { command = "i3-msg 'workspace 2; exec librewolf'"; notification = false; }
      ];

      keybindings = {
        "XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 10%+";
        "XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 10%-";
        "XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_SINK@ toggle";
      
        "${mod}+Control+s" = "exec flameshot gui";
        "${mod}+Return" = "exec kitty -e tmux";
        "${mod}+q" = "kill";
        "${mod}+d" = "exec --no-startup-id dmenu_run";
      
        "${mod}+a" = "exec --no-startup-id cd ~/Downloads/search && kitty -e ./target/release/search";
      
        "${mod}+n" = "focus left";
        "${mod}+e" = "focus down";
        "${mod}+i" = "focus up";
        "${mod}+o" = "focus right";
      
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
      
        "${mod}+h" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
      
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+Shift+s" = "layout toggle split";
      
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+Control+space" = "focus mode_toggle";
      
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
      
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
      
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+r" = "mode resize";
      };

      modes.resize = {
        "n" = "resize shrink width 10 px or 10 ppt";
        "e" = "resize grow height 10 px or 10 ppt";
        "i" = "resize shrink height 10 px or 10 ppt";
        "o" = "resize grow width 10 px or 10 ppt";
      
        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize grow height 10 px or 10 ppt";
        "Up" = "resize shrink height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";
      
        "Return" = "mode default";
        "Escape" = "mode default";
        "${mod}+r" = "mode default";
      };

      window = {
        titlebar = true;
      };

      floating = {
        modifier = mod;
        titlebar = true;
      };

      colors = {
        focused = {
          background = acct2;
          border = dark;
          text = dark;
          indicator = main1;
          childBorder = main1;
        };
      };

      bars = [{
        position = "bottom";
        statusCommand = "i3status";

        colors = {
          background = dark;
          statusline = acct2;
          separator = main1;

          focusedWorkspace = {
            background = acct1;
            border = dark;
            text = dark;
          };

          activeWorkspace = {
            background = acct2;
            border = dark;
            text = dark;
          };

          inactiveWorkspace = {
            background = dark;
            border = dark;
            text = acct1;
          };

          bindingMode = {
            background = main1;
            border = dark;
            text = dark;
          };
        };

        extraConfig = ''
          separator_symbol "<>"
        '';
      }];
    };

    extraConfig = ''
      for_window [title="^search$"] floating enable, resize set 500 350
    '';
  };

  home.packages = with pkgs; [
    i3status
    dex
    xorg.xsetroot
    xorg.xrdb
    redshift
    flameshot
    dmenu
    kitty
  ];
}
