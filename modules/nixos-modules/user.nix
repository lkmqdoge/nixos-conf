{pkgs, inputs, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.lkmqdoge = {
      imports = [
        ./../home-manager
      ];
      home.username = "lkmqdoge";
      home.homeDirectory = "/home/lkmqdoge";
      home.stateVersion = "24.05"; 
      programs.home-manager.enable = true;
      programs.fish.enable = true;
    };
  };
  users.users.lkmqdoge = {
    isNormalUser = true;
    description = "Алексей Кизин";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
  };
  nix.settings.allowed-users = [ "lkmqdoge" ];
}
