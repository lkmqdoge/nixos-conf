{pkgs, ...}: {
  home.packages = with pkgs; [
    # rofi-wayland
    rofi-power-menu
  ];

  programs.rofi = {
    enable = true;
    theme = "Indego";
  };
}
