{ pkgs, inputs, ... }:
{
  users.users.lkmqdoge = {
    isNormalUser = true;
    description = "lkmqdoge";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    shell = pkgs.fish;
  };

  services.flatpak.enable = true;
}
