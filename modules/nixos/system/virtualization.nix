{ pkgs, config, lib, ... }:
{
  services.flatpak.enable = true;

  environment.systemPackages = [
    pkgs.steam-run
    pkgs.bottles
    pkgs.qemu
    pkgs.quickemu
  ];
}
