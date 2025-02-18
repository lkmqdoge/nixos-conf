{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      indent = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;


    lsp = {
      enable = true;
      servers = {
        tsserver.enable = true;
        jsonls.enable = true;
        nil_ls.enable = true;
        clangd.enable = true;
        html.enable = true;
        cssls.enable = true;
        # gdscript.enable = true;
        pyright.enable = true;
        # gdshader_lsp.enable = true;
        java_language_server.enable = true;
        asm_lsp.enable = true;
        csharp_ls.enable = true;
      };
    };
  };
}
