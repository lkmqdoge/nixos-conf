{ pkgs, ... }: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;

    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];

    trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    trusted-users = ["root" "@wheel"];
  };

  time.timeZone = "Europe/Moscow";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = ["ru_RU.UTF-8/UTF-8"];

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [ 
        fcitx5-mozc-ut
        fcitx5-gtk 
      ];
    };
  };
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;
    
  # needed for uv
  environment.localBinInPath = true;

  # fix dynamically linked executable
  programs.nix-ld.enable = true;
}
