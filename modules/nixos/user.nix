{ pkgs, inputs, ... }:
{
  users.users.lkmqdoge = {
    isNormalUser = true;
    description = "lkmqdoge";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  services.flatpak.enable = true;
}
