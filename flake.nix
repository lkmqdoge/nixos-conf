{
  description = "lkmqdoge's nix configuration for NixOS";
  
  # the nixConfig here only affects the flake itself, not the system configuration
  nixConfig = {
    extra-trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    prismlauncher.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
    }:
    {
    nixosConfigurations = { # hostnames
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        system = "x86_64-linux";

        modules = [
          (import ./overlays)
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.lkmqdoge = import ./hosts/laptop/home.nix;
            };
          }
        ];
      };

      # ну и хуйня я убью себя
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        system = "x86_64-linux";

        modules = [
          (import ./overlays)
          ./hosts/desktop/configuration.nix
          inputs.musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.lkmqdoge = import ./hosts/desktop/home.nix;
            };
          }
        ];
      };
    };
  };
}
