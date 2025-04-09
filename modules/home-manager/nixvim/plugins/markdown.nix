{
  programs.nixvim.plugins.render-markdown = {
    enable = true;  
  };
  programs.nixvim.plugins.markdown-preview = {
    enable = true;  
    settings = {
      browser = "firefox";
      port = "8080";
      preview_options = {
        disable_filename = 1;
        disable_sync_scroll = 1;
        sync_scroll_type = "middle";
      };
      theme = "dark";
    };
  };
}
