{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = builtins.attrValues {
    inherit (pkgs.nerd-fonts)
    fira-code
    droid-sans-mono
  ;};
}
