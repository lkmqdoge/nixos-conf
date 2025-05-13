{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./otd.nix
    ./security.nix
    ./login.nix
    ./sound.nix
    ./hyprland.nix
    ./bluetooth.nix
    ./user.nix
    ./boot.nix
    ./network.nix
    ./system.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];
}
