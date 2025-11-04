{pkgs, ...}: {
  programs.nixvim.extraPlugins = with pkgs; [
    vimPlugins.cellular-automaton-nvim
  ];
}
