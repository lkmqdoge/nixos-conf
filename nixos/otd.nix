{ config, lib, ...}:
let 
  cfg = config.modules.nixos.useTablet;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.nixos.useTablet.enable
    = mkEnableOption "Install OpenTabletDriver";

  config = mkIf cfg.enable {
    hardware.opentabletdriver.enable = true;
  };
}
