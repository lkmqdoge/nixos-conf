{ lib, config, ... }:

let
  cfg = config.modules.nixos.system.useBluetooth;
  inherit (lib) mkIf mkEnableOption;
in
{
  options.modules.nixos.system.useBluetooth.enable =
    mkEnableOption "Enable Bluetooth";

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = true;
  };
}
