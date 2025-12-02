{ pkgs, ... }: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];

      auto-optimise-store = true;

      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];

    };
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = ["ru_RU.UTF-8/UTF-8"];
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;
    
  # needed for uv
  environment.localBinInPath = true;

  # fix dynamically linked executable
  programs.nix-ld = {
    enable = true;
  };


  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.07"
  ];
}
