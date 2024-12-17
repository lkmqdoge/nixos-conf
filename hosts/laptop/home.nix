{ inputs, config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home.username = "lkmqdoge";
  home.homeDirectory = "/home/lkmqdoge";
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    prismlauncher
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
    unzip                                           # archive manager
    vlc                                             # media player
    feh                                             # image viewer 
    git   
    wttrbar                                         # thing for weather widget
    pkgs.grim                                       # 
    pkgs.slurp                                      #
    pkgs.wl-clipboard                               # screenshot tool
    htop

    clang
    typescript                                      # typescript for my lab at uni
    nodePackages.typescript-language-server         #
    nodejs_22                                       #
    dotnetCorePackages.sdk_8_0_1xx                  # dotnet sdk -> fuck microsoft
    vesktop                                         # discord on wayland
    libreoffice                                     # office programms
    mc                                              # file manager
  ];

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  home.shellAliases = {
    nv = "nvim";
  };

  programs.fish.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
