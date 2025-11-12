{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  
  programs.amnezia-vpn.enable = true;

  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };
}
