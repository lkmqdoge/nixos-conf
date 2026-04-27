{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./colors.nix
    ./opts.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
