{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland.enable = true;
  # programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = [ pkgs.hyprlock ];
}
