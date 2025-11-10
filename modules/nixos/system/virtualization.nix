{ pkgs, config, lib, ... }:
let
  cfg = config.modules.nixos.system.useVirtualisation;
  inherit (lib) mkEnableOption mkIf;
in
{
    options.modules.nixos.system.useVirtualisation.enable
    = mkEnableOption "Install packages for virtualisation";

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
    environment.systemPackages = builtins.attrValues {
      inherit (pkgs)
      steam-run
      bottles
      qemu
      wine
      quickemu
      ;
    };
  };
}
