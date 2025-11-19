{ ... }:
{
  programs.i3status = {
    enable = true;

    general = {
      colors = true;
    };

    modules = {
      "cpu_usage" = {
        position = 1;
        settings = {
          format = "CPU: %usage";
        };
      };
      "memory" = {
        position = 2;
        settings = {
          format = "MEM: %used";
          threshold_degraded = "10%";
          format_degraded = "MEMORY: %free";
        };
      };
      "disk /" = {
        position = 3;
        settings = {
          format = "D: %avail";
        };
      };
      "volume master" = {
        position = 5;
        settings = {
          format = "VOL: %volume";
        };
      };
      "tztime local" = {
        position = 6;
        settings = {
          format = "%d/%m/%Y - %H:%M";
          timezone = "America/Sao_Paulo";
        };
      };

      "wireless _first_" = {
        enable = false;
      };
      "wireless wlan0" = {
        enable = false;
      };
      "ethernet _first_" = {
        enable = false;
      };
      "ethernet eth0" = {
        enable = false;
      };
      "battery all" = {
        enable = false;
      };
      "ipv6" = {
        enable = false;
      };
      "load" = {
        enable = false;
      };
    };
  };
}
