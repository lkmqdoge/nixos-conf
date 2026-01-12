{ pkgs, lib, ... }:
let
  list-general = pkgs.fetchFromGitHub {
    owner = "Flowseal";
    repo = "zapret-discord-youtube";
    rev = "0bb36b834508057ddbfa313e6508d5120b1609f4";
    hash = "sha256-HHxzS3i1jIzwA3X1nzvW+ZYxsvWmISW1JEDbxjJoWHQ=";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  modules.nixos.gaming.enable = true;
  modules.nixos.useTablet.enable = true;
  modules.nixos.system.useVirtualisation.enable = true; 
  modules.nixos.system.useBluetooth.enable = true; 

  # musnix.enable = true; 

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.amdgpu.initrd.enable = true;
  # enable amdgpu control panel
  services.lact.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];
}
