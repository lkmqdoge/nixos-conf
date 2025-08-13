{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./opts.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.gruvbox.enable = true;
  };
}
