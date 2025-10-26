{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "lkmqdoge";
  home.homeDirectory = "/home/lkmqdoge";
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
