{ pkgs, ... }:
{
  hardware.opentabletdriver.enable = true;

  environment.systemPackages = with pkgs; [
    opentabletdriver # xp-pen drawing tablet driver
  ];
}
