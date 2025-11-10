{ pkgs, lib, ... }:
let 
  inherit (lib) mkMerge;
  openUtauWrapper = (pkgs.writeShellScriptBin "OpenUtau" ''
    export LD_LIBRARY_PATH=${lib.makeLibraryPath [ pkgs.xorg.libXi ] }:$LD_LIBRARY_PATH
    exec ${pkgs.openutau}/bin/OpenUtau "$@"
  '');

   openUtauDesktop = pkgs.makeDesktopItem {
    name = "openutau";
    desktopName = "OpenUtau";
    startupWMClass = "openutau";
    icon = "openutau";
    genericName = "Utau";
    comment = "Open source UTAU successor";
    exec = "OpenUtau";
    categories = [ "Music" ];
  };
in
{
  imports = [
    ../../modules/homeManager
  ];

  home.username = "lkmqdoge";
  home.homeDirectory = "/home/lkmqdoge";
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = mkMerge [
    [
      openUtauWrapper 
      openUtauDesktop
    ]
    (builtins.attrValues {
      inherit (pkgs)

      # osint
      sherlock
      # music
      audacity
      reaper
    ;})
  ];
}
