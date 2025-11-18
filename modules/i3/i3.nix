{ pkgs, ... }:
let
  mod = "Mod1";
  id = "--no-startup-id";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3status;
    config = {
      modifier = mod;

      fonts = {
        names = ["pango"];
        style = "monospace";
        size = 8.0;
      };

      window = {
        commands = [
          {
            command = "resize set 500 350";
            criteria = { class = "^search$"; };
          }
        ];
      };

      floating = {
        modifier = mod;
        criteria = [
          { class = "^search$"; }
        ];
      };

      keybindings = {
        "XF86AudioRaiseVolume" = "exec ${id} wpctl set-volume @DEFAULT_SINK@ 10%+ && $refresh_i3status";
        "XF86AudioLowerVolume" = "exec ${id} wpctl set-volume @DEFAULT_SINK@ 10%- && $refresh_i3status";
        "XF86AudioMute" = "exec ${id} wpctl set-mute @DEFAULT_SINK@ && $refresh_i3status";

        "${mod}+Control+s" = "exec 'flameshot gui'";
        "${mod}+a" = "exec ${id} cd /media/OS/codes/languages/rust/projects/search && kitty -e ./target/release/search";

        "${mod}+Return" = "exec kitty -e tmux";
        "${mod}+q" = "kill"; # could be a better name... :/
        "${mod}+d" = "exec ${id} dmenu_run";
        "${mod}+f" = "fullscreen toggle";

        "${mod}+n" = "focus left";
        "${mod}+e" = "focus down";
        "${mod}+u" = "focus up";
        "${mod}+i" = "focus right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move righ";

        "${mod}+h" = "split h";
        "${mod}+v" = "split v";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+Shift+s" = "layout toggle split";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+Control+space" = "focus mode_toggle";

        "${mod}+1" = "workspace number $ws1";
        "${mod}+2" = "workspace number $ws2";
        "${mod}+3" = "workspace number $ws3";
        "${mod}+4" = "workspace number $ws4";
        "${mod}+5" = "workspace number $ws5";
        "${mod}+6" = "workspace number $ws6";
        "${mod}+7" = "workspace number $ws7";
        "${mod}+8" = "workspace number $ws8";
        "${mod}+9" = "workspace number $ws9";
        "${mod}+10" = "workspace number $ws10";

        "${mod}+Shift+1" = "move container to workspace number $ws1";
        "${mod}+Shift+2" = "move container to workspace number $ws2";
        "${mod}+Shift+3" = "move container to workspace number $ws3";
        "${mod}+Shift+4" = "move container to workspace number $ws4";
        "${mod}+Shift+5" = "move container to workspace number $ws5";
        "${mod}+Shift+6" = "move container to workspace number $ws6";
        "${mod}+Shift+7" = "move container to workspace number $ws7";
        "${mod}+Shift+8" = "move container to workspace number $ws8";
        "${mod}+Shift+9" = "move container to workspace number $ws9";
        "${mod}+Shift+10" = "move container to workspace number $ws10";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+r" = "resize";
      };

      modes.resize = {
        "n" = "resize shrink width 10 px or 10 ppt";
        "e" = "resize shrink width 10 px or 10 ppt";
        "u" = "resize shrink width 10 px or 10 ppt";
        "i" = "resize shrink width 10 px or 10 ppt";

        "Escape" = "mode default";
        "Return" = "mode default";
        "${mod}+r" = "mode default";
      };

      startup = [
        {
          command = "dex --autostart --environment i3";
          always = false;
          notification = false;
        }
        {
          command = "redshift -O 4000";
          always = false;
          notification = false;
        }
        {
          command = "flameshot";
          always = false;
          notification = false;
        }
        {
          command = "spotify";
          always = false;
          notification = false;
        }
        {
          command = "discord";
          always = false;
          notification = false;
        }
        {
          command = "librewolf";
          always = false;
          notification = false;
        }
      ];

      assigns = {
        "0" = [
          { class = "spotify"; }
          { class = "discord"; }
        ];
        "1" = [
          { class = "librewolf"; }
        ];
      };

      colors = {
        focused = {
          background  = "$acct2";
          border      = "$dark";
          childBorder = "$dark";
          indicator   = "$main1";
          text        = "$dark";
        };
      };

      bars = [
        {
          statusCommand = "i3status -c ../../config/i3status/i3status.conf";

          colors = {
            background = "$dark";
            statusline = "$acct2";
            separator  = "$main1";

            focusedWorkspace = {
              border = "$dark";
              background = "$acct2";
              text = "$dark";
            };
            inactiveWorkspace = {
              border = "$dark";
              background = "$dark";
              text = "$acct1";
            };
            bindingMode = {
              border = "$dark";
              background = "$main1";
              text = "$dark";
            };
          };

          extraConfig = ''
            separator_symbol "<>"
          '';
        }
      ];
    };

    extraConfig = ''
      set $refresh_i3status killall -SIGUSR1 i3status

      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"
      set $ws10 "10"

      set $main1 #a26769
      set $main2 #d5b9b2
      set $acct1 #bfb5af
      set $acct2 #ece2d0
      set $dark  #582c4d
    '';
  };
}
