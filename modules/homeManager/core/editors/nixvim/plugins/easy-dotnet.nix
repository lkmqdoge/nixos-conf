{
  programs.nixvim.plugins.easy-dotnet = {
    enable = true;
    settings = {
      auto_bootstrap_namespace = {
        enabled = true;
        type = "file_scoped";
      };

      picker = "snacks";
    };
  };
}
