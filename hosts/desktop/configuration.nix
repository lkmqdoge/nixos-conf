{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  modules.nixos.gaming.enable = true;
  modules.nixos.useTablet.enable = true;
  modules.nixos.system.useBluetooth.enable = false; # no adapter :(
  modules.nixos.system.useVirtualisation.enable = true; 
}
