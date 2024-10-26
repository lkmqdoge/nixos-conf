{inputs, username, host, ...}: {
  imports = [
    ./vscodium.nix
    ./hyprland                        # window manager
    ./waybar
    ./gtk.nix                         # gtk theme
    ./packages.nix
    ./rofi.nix
  ];
}
