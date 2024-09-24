{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      extraConfig = "monitor=,preferred,auto,1";

      #autostart
      exec-once = [ 
        "swww init &"

        "swww img ~/Загрузки/wallpaper1.jpg &"

        "nm-applet --indicator &"

        "waybar &"

        "dunst"
      ];

      input = {
        kb_layout = "us, ru";
        kb_options = "grp:alt_shift_toggle";
        folow_mouse = 0;
        sensivity = 0;
        touchpad = {
          natural_scroll = true;
        }; 
      };

      general = {
        resize_on_border = true;
        gaps_in = 1;
        gaps_out = 1;
        border_size = 2;
        "col.active_border" = "rgb(e9e9ea)";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 2;
        blur.enabled = false;
        drop_shadow = false;
      };

      animations.enabled = false;

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master  = {
        new_status = "master";
        mfact = 0.5;
      };

      gestures = {
        workspace_swipe = "on";
        workspace_swipe_invert = "no";
        workspace_swipe_cancel_ratio = 0.1;
      };

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0; 
        vfr = true;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
        warp_on_change_workspace = true;
        no_warps = true;
      };
        

      windowrule = [
        "float,title:^(Open File)(.*)$"
        "float,title:^(Select a File)(.*)$"
        "float,title:^(Choose wallpaper)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$"
        "float,title:^(File Upload)(.*)$"
        
        "size 1280 720,^(org.telegram.desktop)$"
        "float,^(org.telegram.desktop)$"
                                       
        "float,^(discord)$"
        "size 1600 900,^(discord)$"
                                       
        "float,^(kitty)$"
        "size 1280 720,^(kitty)$"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float, class: (pwvucontrol)"
        "size 600 400, class: (pwvucontrol)"
        "move 58% 4%, class: (pwvucontrol)"

        "float, class: (thunar)"
        "size 1280 720, class: (thunar)"
      ];

      "$mainMod" = "SUPER";
       bind = [

        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive," 
        "$mainMod, M, exit," 
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating, "
        "$mainMod, J, togglesplit,"
        "$mainMod, T, exec, telegram-desktop"
        "$mainMod, D, exec, discord"
        "$mainMod, P, pin"
                                       
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
                                       
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
                                       
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
                                       
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        "$mainMod CTRL, left, resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive, 60 0"
        "$mainMod CTRL, down, resizeactive, 0 60"
                                                             
        "$mainMod, O, togglespecialworkspace, magic"
        "$mainMod SHIFT, O, movetoworkspace, special:magic"
                                                             
        "SUPER, Tab, cyclenext, "
        "SUPER, Tab, bringactivetotop," 
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
                                                             
        "$mainMod SHIFT, S, exec, grim -l 0 -g '$(slurp)' - | wl-copy"
        "$mainMod, H, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"
                                               
        "$mainMod, S, exec, rofi -show drun -show-icons"

  ];

  binde = [
    ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86MonBrightnessUp,   exec, brightnessctl s 10%+"
    ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
  ];

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
    };
  };
}
