{ ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
    # To prevent getting stuck at shutdown
  boot.loader.configurationLimit = 10;
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
