{ pkgs, ... }:
{
  programs.nixvim.colorschemes = {
    gruvbox-material.enable = true;
  };

  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    gruvbox-baby
    aurora
    ayu-vim
    cyberdream-nvim
  ];
}
