{ pkgs, ... }: 
{
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.vifm-vim
  ];
}
