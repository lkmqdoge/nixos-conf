{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  modules.nixos.system.useBluetooth.enable = true; 
  modules.nixos.useTablet.enable = true;

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    acpi # show battery status
    brightnessctl
    cpupower-gui
    powertop # tool for analyzing power consumption
  ;};

  services = {
    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
  };

  powerManagement.cpuFreqGovernor = "ondemand";

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [pkgs.cpupower-gui];
  };
}
