{pkgs, ...}: {
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  programs.thunar.plugins = builtins.attrValues {
    inherit (pkgs) 

    thunar-archive-plugin
    thunar-vcs-plugin;
  };
  environment.systemPackages = [
    pkgs.dosfstools
  ];

  services.gvfs.enable = true;    # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
