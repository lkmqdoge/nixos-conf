{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
  services = {
    xserver.enable = false; 
    getty.autologinUser = "lkmqdoge";
    greetd ={
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.hyprland}/bin/Hyprland";
          user = "lkmqdoge";
        };
      };
    };
  };
}
