{ pkgs, ... }: {
  home.packages = [ pkgs.rofi-power-menu ];

  programs.rofi = {
    enable = true;
    theme = "Indego";
  };
}
