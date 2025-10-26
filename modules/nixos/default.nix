{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./otd.nix
    ./mysql.nix
    ./security.nix
    ./login.nix
    ./sound.nix
    ./hyprland.nix
    ./bluetooth.nix
    ./user.nix
    ./boot.nix
    ./network.nix
    ./system.nix
    ./thunar.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];
}
