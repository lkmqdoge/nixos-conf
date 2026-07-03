{
  description = "lkmqdoge's nix configuration for NixOS";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    prismlauncher.inputs.nixpkgs.follows = "nixpkgs";
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
          ./Hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.lkmqdoge = import ./Hosts/laptop/home.nix;
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
          ./Hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.lkmqdoge = import ./Hosts/desktop/home.nix;
            };
          }
        ];
      };
    };
  };
}
