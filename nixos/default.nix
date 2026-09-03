{ config, inputs, pkgs, ...}:
{
  _module.args.pkgsStable = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };

  imports = [
    ./de
    ./system

    ./gaming.nix
    ./otd.nix
    ./packages.nix
    ./thunar.nix
    ./webcam.nix
  ];
}
