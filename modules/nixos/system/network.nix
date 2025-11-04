{ pkgs, ... }:
{
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs) networkmanagerapplet;
  };

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
  
  programs.amnezia-vpn.enable = true;

  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };
}
