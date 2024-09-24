{ config, pkgs, ... }:
{
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    modules-left = [ "hyprland/workspaces" "hyprland/language" "network" "hyprland/window" ];
    modules-center = [ "clock" "custom/weather" ];
    modules-right = [ "pulseaudio" "custom/mem" "cpu" "backlight" "temperature" "battery" "tray" ];

    "hyprland/workspaces" = {
      disable-scroll = true;
    };

    "hyprland/language" = {
      format-en = "US";
      format-ru = "RU";
      min-length = 3;
      tooltip = false;
    };

    network = {
      interface = "wlp1s0";
      format = "{ifname}";
      format-wifi = "{essid} {bandwidthTotalBytes} ";
      format-ethernet = "{ipaddr}/{cidr} 󰊗";
      format-disconnected = "";
      tooltip-format = "{ifname} via {gwaddr} 󰊗";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname} ";
      tooltip-format-disconnected = "Disconnected";
      interval = 5;
      max-length = 50;
    };

    "hyprland/window" = {
      format = ":3 {}";
    };

    "hyprland/submap" = {
      format = ":3 {}";
      max-length = 8;
      tooltip = false;
    };

    clock = {
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format = "{:%a, %d %b, %I:%M %p}";
    };

    "custom/weather" = {
      format = "{} °";
      tooltip = true;
      interval = 1800;
      exec = "wttrbar";
      return-type = "json";
    };

    pulseaudio = {
      reverse-scrolling = 1;
      format = "{volume}% {icon}  {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-muted = " MUTED";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphone = "";
        "hands-free" = "󰥰";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };
      on-click = "pwvucontrol";
      min-length = 13;
    };

    "custom/mem" = {
      format = "{} 󰟖";
      interval = 3;
      exec = "free -h | awk '/Mem:/{printf $3}'";
      tooltip = false;
    };

    cpu = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    temperature = {
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = [ "" "" "" "" "" ];
      tooltip = false;
    };

    backlight = {
      device = "intel_backlight";
      format = "{percent}% {icon}";
      format-icons = [ "󰌵" ];
      min-length = 7;
    };

    battery = {
      interval = 5;
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% 󰂅";
      format-plugged = "{capacity}% ";
      format-alt = "{time} {icon}";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
    };

    tray = {
      "icon-size" = 16;
      spacing = 0;
    };
  };
}
