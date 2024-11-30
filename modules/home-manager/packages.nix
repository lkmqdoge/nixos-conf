{ config, pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher # minecraft launcher
    gnome.gnome-software
    steam-run
    kitty
    pamixer
    rofi-wayland
    brightnessctl   
    pwvucontrol
    xfce.thunar 
    firefox
    swww
    vim
    telegram-desktop
    pkgs.dunst
    glib
    libnotify
    font-awesome
    unzip                                           # archive manager
    vlc                                             # media player
    feh
    git   
    wttrbar
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    clang
    htop
    typescript                                      # typescript for my lab at uni
    nodePackages.typescript-language-server         #
    nodejs_22                                       #
    virtualbox                                      # vbox
    dotnetCorePackages.sdk_8_0_1xx                  # dotnet sdk -> fuck microsoft
    vesktop                                         # discord on wayland
    libreoffice                                     # office programms
  ];
}
