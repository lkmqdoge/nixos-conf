{ pkgs, config, ... }:
{
  users.users.lkmqdoge.extraGroups = [ "adbusers" ];

  environment.systemPackages = [
    pkgs.android-tools
    pkgs.v4l-utils
    pkgs.scrcpy
  ];

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    kernelModules = [
      "v4l2loopback"
    ];

    extraModprobeConfig = ''
      options v4l2loopback video_nr=0 card_label="Scrcpy" exclusive_caps=1
    '';
  };
}
