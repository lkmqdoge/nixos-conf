{ pkgs, config, lib, ... }:
let
  cfg = config.modules.nixos.db;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.nixos.db.enable = 
    mkEnableOption "Install and run database service";
  
  config = mkIf cfg.enable {
    services = {
      # mysql = {
      #   enable = true;
      #   package = pkgs.mariadb;
      # };
      postgresql = {
        enable = true;
        ensureDatabases = [ "mydatabase" ];
        authentication = pkgs.lib.mkOverride 10 ''
          #type database  DBuser  auth-method
          local all       all     trust
        '';
      };
    };
    
    environment.systemPackages = [
      pkgs.dbeaver-bin
    ];
  };
}
