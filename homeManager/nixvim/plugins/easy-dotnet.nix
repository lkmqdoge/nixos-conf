{
  programs.nixvim.plugins.easy-dotnet = {
    enable = true;
    settings = {
      lsp = { # use roslyn plugin instead
        enabled = false;
      };

      auto_bootstrap_namespace = {
        enabled = true;
        type = "file_scoped";
      };

      picker = "snacks";
    };
  }; 
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cs",
      callback = function()
        vim.bo.indentexpr = ""
      end,
    })
  '';
}
