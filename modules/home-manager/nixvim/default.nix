{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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
