{ pkgs, ...}:
{
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  # 
  #   firewall = {
  #     allowedUDPPorts = [ 51820 ]; 
  #   };
  #
  #   # Enable WireGuard
  #   wireguard = {
  #     enable = true;
  #     interfaces = {
  #       wg0 = {
  #         listenPort = 51820; 
  #         ips = [ "10.100.0.2/24" ];
  #
  #         privateKey = "SE3PC9htc0jZ6IMXiKxmVf9wD+VYCh2k9NtKgtwCrU4=";
  #         peers = [
  #           {
  #             publicKey = "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=";
  #             allowedIPs = [ "0.0.0.0/0" "::/0" ];
  #             endpoint = "engage.cloudflareclient.com:2408";
  #             persistentKeepalive = 25; 
  #           }
  #         ];
  #       };
  #     };
  #   };
  };

  environment.systemPackages = with pkgs; [
      networkmanagerapplet
  ];
}
