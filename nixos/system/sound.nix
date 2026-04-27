{pkgs, ...}: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    wireplumber.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    alsa.enable = true;
    enable = true;
  };

  environment.systemPackages = [
    pkgs.pavucontrol
  ];
}
