{ pkgs, lib, ... }: 
let
  inherit (lib) mkMerge;
in{
  home.packages = mkMerge [
    (builtins.attrValues {
      inherit (pkgs)

      # https://github.com/nix-community/nix-melt
      nix-melt # A TUI flake.lock viewer
      # https://github.com/utdemir/nix-tree
      nix-tree # A TUI to visualize the dependency graph of a nix derivation


      grc  # colorizer
      glib
      libnotify
      pamixer
      pwvucontrol
        
      prismlauncher # minecraft launcher
      kitty # terminal emulator
      telegram-desktop
      firefox
      krita
      vesktop 
      libreoffice
      obsidian # note taking app
      vlc # media player
      feh # image viewer
      qimgv # better image viewer
      btop # resource monitor

      # desktop utils
      swww # wallpapers
      wttrbar # show weather 

      # things for screenshot
      grim 
      slurp 
      wl-clipboard 

      qbittorrent
      ;
    })
  ];
}
