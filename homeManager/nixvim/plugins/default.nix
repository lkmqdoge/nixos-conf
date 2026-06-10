{
  imports = [
    ./cmp.nix
    ./dap.nix

    ./easy-dotnet.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown.nix
    ./mini.nix
    ./neotree.nix
    ./snacks.nix
    ./trouble.nix
  ];

  programs.nixvim.plugins.comment.enable = true;
  programs.nixvim.plugins.autoclose.enable = true;
  programs.nixvim.plugins.actions-preview.enable = true;
  programs.nixvim.plugins.fidget.enable = true;
  programs.nixvim.plugins.gitsigns.enable = true;
  programs.nixvim.plugins.godot = {
    enable = true;
    settings.executable = "godot4-mono";
  };
  programs.nixvim.plugins.nix.enable = true;
  programs.nixvim.plugins.tmux-navigator.enable = true;
  programs.nixvim.plugins.todo-comments.enable = true;
  programs.nixvim.plugins.ts-autotag.enable = true;
  programs.nixvim.plugins.vim-css-color.enable = true;
  programs.nixvim.plugins.nvim-surround.enable = true;
  programs.nixvim.plugins.friendly-snippets.enable = true;
}
