{inputs, username, host, ...}: {
  imports = [
    ./hyprland                        # window manager
    ./fonts.nix                       # fonts
    ./waybar
    ./gtk.nix                         # gtk theme
    ./rofi.nix
    ./packages.nix
    ./godot.nix

    ./thunar.nix
    ./fastfetch.nix

    # Editors
    ./vscodium.nix
    ./nixvim
  ];
}
