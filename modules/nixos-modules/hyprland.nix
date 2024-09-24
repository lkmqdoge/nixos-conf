{ pkgs, inputs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  security.pam.services.hyprlock = {};
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = with pkgs; [
    hyprcursor
    hyprlock
  ];
}
