{ pkgs, ...}:
{
  services.passSecretService.enable = true;
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
