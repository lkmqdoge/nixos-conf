{ pkgs, ... }: {
  nix.settings = {
    trusted-users = ["lkmqdoge"];
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    trusted-substituters = [];
    trusted-public-keys = [];
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = ["ru_RU.UTF-8/UTF-8"];
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;
    
  # needed for uv
  environment.localBinInPath = true;

  # fix dynamically linked executable
  programs.nix-ld.enable = true;
}
