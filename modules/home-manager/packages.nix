{ pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [

    pamixer
    brightnessctl   
    pwvucontrol

    prismlauncher                                   # minecraft launcher
    kitty                                           # terminal :3
    xfce.thunar 
    telegram-desktop
    firefox
    vim
    unzip                                           # archive manager
    vlc                                             # media player
    feh                                             # image viewer 
    htop

    libnotify
    pkgs.dunst
    swww                                            # wallpaper util
    wttrbar                                         # thing for weather widget
    pkgs.grim                                       # 
    pkgs.slurp                                      #
    pkgs.wl-clipboard                               # screenshot tool
    
    glib
    gcc
    jdk

    fasm                                            # assmembly
    gdb                                             # debugger for assmembly

    typescript                                      # typescript for my lab at uni
    nodePackages.typescript-language-server         #
    nodejs_22                                       #
    dotnetCorePackages.dotnet_8.sdk

    aseprite
    krita
    vesktop                                         # discord on wayland
    libreoffice                                     # office programms
  ];
}
