{
  description = "lkmqdoge's nixos config flake";

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

    prismlauncher = {
     url = "github:PrismLauncher/PrismLauncher";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = inputs @ { 
    self, 
    nixpkgs, 
    stylix,
    home-manager,
    chaotic, 
    ... 
  } :
    let
      lib = nixpkgs.lib;
    in
  {    
    inherit lib;

    nixosConfigurations = {
      laptop = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./hosts/laptop 
          stylix.nixosModules.stylix
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
