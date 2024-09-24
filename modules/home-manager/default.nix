{inputs, username, host, ...}: {
  imports = [
    ./hyprland                        # window manager
    ./waybar
    ./gtk.nix                         # gtk theme
    ./packages.nix
    ./rofi.nix
  ];
}
