{
  programs.nixvim.plugins.luasnip = {
    enable = true;
    fromVscode = [ {} ];
  };
  programs.nixvim.plugins.friendly-snippets.enable = true;
}
