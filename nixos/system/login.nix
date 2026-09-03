{pkgs, ...}: {
  services = {
    xserver.enable = false;

    getty.autologinUser = "lkmqdoge";
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.hyprland}/bin/start-hyprland";
          user = "lkmqdoge";
        };
      };
    };
  };
}
