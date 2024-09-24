{pkgs, inputs, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    user = {
      imports = [
        ./../home-manager/default.nix
      ];
      home.username = "lkmqdoge";
      home.homeDirectory = "/home/lkmqdoge";
      home.stateVersion = "24.05"; 
      programs.home-manager.enable = true;
    };
  };
  users.users.lkmqdoge = {
    isNormalUser = true;
    description = "Алексей Кизин";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    shell = pkgs.fish;
  };
  nix.settings.allowed-users = [ "lkmqdoge" ];
}
