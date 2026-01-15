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
  programs.amnezia-vpn.enable = true; # cloudflare proxy
  services.xray = {                   # socks proxy
    enable = true;
    settingsFile = "/etc/xray/config.json";
  };


  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };
}
