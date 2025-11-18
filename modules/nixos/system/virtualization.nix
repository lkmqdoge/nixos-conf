{ pkgs, config, lib, ... }:
let
  cfg = config.modules.nixos.system.useVirtualisation;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.nixos.system.useVirtualisation.enable
    = mkEnableOption "Install packages for virtualisation";

  config = mkIf cfg.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
    users.groups.libvirtd.members = [ "lkmqdoge" ];

    programs.dconf.enable = true;
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virt-viewer
      spice spice-gtk
      spice-protocol
      virtio-win
      win-spice
      adwaita-icon-theme

      # sandboxing
      wine64
      steam-run
    ];

    services.flatpak.enable = true;
  };
}
