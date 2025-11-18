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
      "volume master" = {
        position = 3;
        settings = {
          format = "VOL: %volume";
        };
      };
      "tztime local" = {
        position = 4;
        settings = {
          format = "%d/%m/%Y - %H:%M";
          timezone = "America/Sao_Paulo";
        };
      };
    };
  };
}
