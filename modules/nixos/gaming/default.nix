{ pkgs, lib, config, ...}: 
let
  cfg = config.modules.nixos.gaming;
  tcfg = config.modules.nixos.useTablet;
  inherit (lib) mkEnableOption mkIf mkMerge;
in
{
  options.modules.nixos.gaming.enable
    = mkEnableOption "Install Game Suite (Steam, Mod-managers, osu, etc.)";

  config = mkIf cfg.enable { 
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    hardware.steam-hardware.enable = true;
    hardware.xpadneo.enable = true; # xbox wireless controller
    environment.systemPackages = mkMerge [
      (builtins.attrValues { inherit (pkgs)
        lutris
        r2modman 
        mangohud
        protonup-ng
      ;})
      (mkIf tcfg.enable [pkgs.osu-lazer-bin])
    ];

  };
}
