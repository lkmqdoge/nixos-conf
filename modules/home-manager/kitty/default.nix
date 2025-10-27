{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty-themes
  ];
  programs.kitty = {
    enable = true;
    settings = {
      theme = "FishTank";
    };
  };
}
