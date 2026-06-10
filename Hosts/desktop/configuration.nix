{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  modules.nixos.gaming.enable = true;
  modules.nixos.useTablet.enable = true;
  modules.nixos.system.useVirtualisation.enable = true; 
  modules.nixos.system.useBluetooth.enable = true; 

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.overdrive.enable = true;
  hardware.amdgpu.overdrive.ppfeaturemask = "0xffffffff";
  services.lact.enable = true;
  services.zerotierone.enable = true;

  networking.firewall.allowedTCPPorts = [ 50505 ];
  networking.firewall.allowedUDPPorts = [ 50505 ];

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];
}
