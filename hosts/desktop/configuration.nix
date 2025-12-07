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

  musnix.enable = true; 

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  services.zapret = {
    enable = false;
    udpSupport = true;

    udpPorts = [
      "443"
      "50000:65535"
    ];

    params = [
      # "--filter-tcp=80"
      # "--hostlist=${list-general}"
      # "--dpi-desync=fake,split2"
      # "--dpi-desync-autottl=2"
      # "--dpi-desync-fooling=md5sig"
      #
      # "--new"
      # "--filter-tcp=443"
      # "--hostlist=${list-general}"
      # "--dpi-desync=fake,multidisorder"
      # "--dpi-desync-split-pos=midsld"
      # "--dpi-desync-repeats=8"
      # "--dpi-desync-fooling=md5sig,badseq"
      #
      # "--new"
      # "--filter-udp=443"
      # "--hostlist=${list-general}"
      # "--dpi-desync=fake"
      # "--dpi-desync-repeats=6"
      #
      # "--new"
      # "--filter-udp=50000-50099"
      # "--filter-l7=discord,stun"
      # "--dpi-desync=fake"
      # "--dpi-desync-repeats=6"
    ];
  };
}
