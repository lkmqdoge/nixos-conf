{ lib, config, ... }:

let
  cfg = config.modules.nixos.system.useBluetooth;
  inherit (lib) mkIf mkEnableOption;
in
{
  options.modules.nixos.system.useBluetooth.enable =
    mkEnableOption "Enable Bluetooth";

  config = mkIf cfg.enable {
    hardware.xpadneo.enable = true; # Enable the xpadneo driver for Xbox One wireless controllers

    # Enable Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        experimental = true; # show battery

        # https://www.reddit.com/r/NixOS/comments/1ch5d2p/comment/lkbabax/
        # for pairing bluetooth controller
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
        FastConnectable = true;
      };
    };

    services.blueman.enable = true;

    boot = {
      extraModprobeConfig = ''
        options bluetooth disable_ertm=Y
      '';
    };
  };
}
