{pkgs, ...}: 
{
  systemd.packages = with pkgs; [
    auto-cpufreq
  ];
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  powerManagement.powertop.enable = true;

  services = {
    thermald.enable = true;
    auto-cpufreq.enable = true;
    upower.enable = true;
  };
}
