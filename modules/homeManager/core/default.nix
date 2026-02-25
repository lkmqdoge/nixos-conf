{ pkgs, lib, ... }: 
let
  inherit (lib) mkMerge;
in
{
  imports = [
    ./editors
    ./fish
    
    ./tmux.nix
    ./vifm.nix
    ./yazi.nix
  ];

  home.packages = mkMerge [
    (builtins.attrValues {
      inherit (pkgs)
        
      # gui apps
      prismlauncher     # minecraft launcher
      kitty             # terminal emulator
      telegram-desktop  # fuck this app
      feh               # image viewer
      pwvucontrol       # sound control
      peazip            # gui archive viewer
      qbittorrent
      mpv
      vlc
      firefox
      krita
      discord
      libreoffice
      btop 
      pinta # simple image editor
      
      # https://github.com/nix-community/nix-melt
      nix-melt # A TUI flake.lock viewer
      # https://github.com/utdemir/nix-tree
      nix-tree # A TUI to visualize the dependency graph of a nix derivation
      glib
      libnotify
      pamixer
      ffmpeg
      swww    # wallpapers
      wttrbar # show weather 

      ydotool

      # things for screenshot
      grim 
      slurp 
      wl-clipboard 
      grc   # colorizer
      delta # better git pager
      bat   # better cat
      ;})
  ];
}
