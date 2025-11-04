{ pkgs, ... }: {
  home.packages = builtins.attrValues {
    inherit (pkgs)

    pamixer

    # colorizer
    grc 

    glib
    libnotify
    
    pwvucontrol
      
    # minecraft launcher
    prismlauncher 

    # terminal emulator
    kitty 

    telegram-desktop
    firefox
    krita
    vesktop 
    libreoffice
    audacity 

    # media player
    vlc

    # image viewer
    feh 

    # resource monitor
    btop
    
    # wallpapers
    swww 
    
    # show weather 
    wttrbar 

    # things for screenshot
    grim 
    slurp 
    wl-clipboard 
  ;};
}
