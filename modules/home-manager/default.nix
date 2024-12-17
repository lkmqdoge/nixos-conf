{inputs, username, host, ...}: {
  imports = [
    ./fonts.nix
    ./vscodium.nix
    ./hyprland                        # window manager
    ./waybar
    ./gtk.nix                         # gtk theme
    ./rofi.nix
    ./nixvim
  ];
}
