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

      # https://github.com/nix-community/nix-melt
      nix-melt # A TUI flake.lock viewer
      # https://github.com/utdemir/nix-tree
      nix-tree # A TUI to visualize the dependency graph of a nix derivation


      glib
      libnotify
      pamixer
      pwvucontrol
        
      readest           # modern ebook reader
      prismlauncher     # minecraft launcher
      kitty             # terminal emulator
      telegram-desktop
      firefox
      krita
      discord
      libreoffice
      btop # resource monitor

      # desktop utils
      swww # wallpapers
      wttrbar # show weather 

      # media
      vlc # media player
      feh # image viewer
      ffmpeg

      # things for screenshot
      grim 
      slurp 
      wl-clipboard 

      qbittorrent

      grc  # colorizer
      delta # better git pager
      bat # better cat
      ;
    })
  ];
}
