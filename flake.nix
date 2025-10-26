{
  description = "lkmqdoge's nixos config flake";

  nixConfig = {
    # will be appended to the system-level substituters
    extra-substituters = [
      # nix community's cache server
      "https://nix-community.cachix.org"
    ];

    # will be appended to the system-level trusted-public-keys
    extra-trusted-public-keys = [
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    alejandra,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem rec {
        specialArgs = {inherit self inputs;};
        system = "x86_64-linux";

        modules = [
          ./hosts/laptop/configuration.nix
          {
            environment.systemPackages = [alejandra.defaultPackage.${system}];
          }

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
      desktop = nixpkgs.lib.nixosSystem rec {
        specialArgs = {inherit self inputs;};
        system = "x86_64-linux";

        modules = [
          ./hosts/desktop/configuration.nix
          {
            environment.systemPackages = [alejandra.defaultPackage.${system}];
          }

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
