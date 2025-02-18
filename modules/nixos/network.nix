{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
      networkmanagerapplet
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
   
  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };

  # services.zapret = {
  #   enable = true;
  #   udpSupport = true;
  #   udpPorts = [
  #     "443"
  #     "50000:65535"
  #   ];
  #   params = [
  #     # "--dpi-desync=fake,split2"
  #     # "--dpi-desync-ttl=7"
  #     # "--dpi-desync-fooling=badseq"
  #     # "--wssize 1:6"
  #     # "--dpi-desync-fake-tls=0x00000000"
  #     # "--dpi-desync-any-protocol"
  #   ];
  # };
}
