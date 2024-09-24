{ inputs, ... }: 
{
  imports = [
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
