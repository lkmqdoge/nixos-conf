{ inputs, ... }: 
{
  imports = [
    ./config.nix
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
