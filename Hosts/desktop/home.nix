{ pkgs, lib, ... }:
let 
  inherit (lib) mkMerge;
in
{
  imports = [
    ../../homeManager
  ];

  home.username = "lkmqdoge";
  home.homeDirectory = "/home/lkmqdoge";
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = (builtins.attrValues {
      inherit (pkgs)
      pcsx2
      blender
      audacity
  ;});
}
