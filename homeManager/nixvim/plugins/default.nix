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
    ./snippets.nix
    ./trouble.nix
  ];

  programs.nixvim.plugins = {
    comment.enable = true;
    autoclose.enable = true;
    actions-preview.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
    nix.enable = true;
    tmux-navigator.enable = true;
    todo-comments.enable = true;
    ts-autotag.enable = true;
    vim-css-color.enable = true;
    nvim-surround.enable = true;
    godot = {
      enable = true;
      settings.executable = "godot4-mono";
    };
  };
}
