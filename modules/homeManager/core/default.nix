{ pkgs, lib, ... }: 
let
  inherit (lib) mkMerge;
in
{
  imports = [
    ./editors
    ./fish

    ./tmux.nix
    ./yazi.nix
  ];

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
      discord
      libreoffice
      obsidian # note taking app
      vlc # media player
      feh # image viewer
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
