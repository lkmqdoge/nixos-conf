{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  
  environment.sessionVariables = {
    XRAY_LOCATION_ASSET = "/etc/xray";
  };
  programs.amnezia-vpn.enable = true; 

  services.xray = {                  
    enable = true;
    settingsFile = "/etc/xray/config.json";
  };


  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };
}
