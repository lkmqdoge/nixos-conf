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
    hardware.xone.enable = true; # support for the xbox controller USB dongle
    environment.systemPackages = mkMerge [
      (builtins.attrValues { inherit (pkgs) r2modman protonup-ng; })
      (mkIf tcfg.enable [pkgs.osu-lazer-bin])
    ];

  };
}
