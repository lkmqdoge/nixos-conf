{
  description = "lkmqdoge's nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher = {
     url = "github:PrismLauncher/PrismLauncher";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { 
    self, 
    nixpkgs, 
    home-manager,
    ... 
  }: {    
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit self inputs; };
        modules = [ 
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.lkmqdoge = import ./hosts/laptop/home.nix;
            };
          }
        ];
      };
    };
  };
}
