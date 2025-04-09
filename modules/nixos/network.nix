{pkgs, config, ...}: {
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    samba
    cifs-utils
    unison
    zapret
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  systemd = {
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };

  # networking.wg-quick.interfaces = {
  #   wg0 = {
  #     address = [ "192.168.42.26/32" ];
  #     privateKeyFile = "/home/lkmqdoge/wireguard-keys/private";
  #     
  #     peers = [
  #       {
  #         publicKey = "fr3gND42tdbjQWnQM5BhyhbJB29j0YhpygLdWYhWmUs=";
  #         allowedIPs = [ "192.168.42.0/24" "10.0.1.0/24" ];
  #         endpoint = "5.167.50.74:30228";
  #         persistentKeepalive = 25;
  #       }
  #     ];
  #   };
  # };

  # networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
  # fileSystems."/home/lkmqdoge/fs2" = {
  #   device = "//10.0.1.13/data";
  #   fsType = "cifs";
  #   options = 
  #     let
  #       automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";
  #
  #     in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=${toString config.users.groups.users.gid}"];
  # };
  # services.samba = {
  #   enable = true;
  #   securityType = "user";
  #  openFirewall = true;
  # };
  # systemd.tmpfiles.rules = [
  #   "d /home/lkmqdoge/fs2 0770 lkmqdoge lkmqdoge - -"
  # ];

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
