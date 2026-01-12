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
}
