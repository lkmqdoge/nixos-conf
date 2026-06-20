{ pkgs, ... }: {
  nix.settings = {
    trusted-users = ["lkmqdoge"];
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    trusted-substituters = [];
    trusted-public-keys = [];
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
