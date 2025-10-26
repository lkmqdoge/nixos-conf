{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];
}
