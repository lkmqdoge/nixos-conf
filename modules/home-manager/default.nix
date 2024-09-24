{inputs, username, host, ...}: {
  imports = [
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
  ];
}
