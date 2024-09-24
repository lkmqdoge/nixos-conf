{ pkgs, ...}:
{
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
  environment.systemPackages = with pkgs; [
      networkmanagerapplet
  ];
}
