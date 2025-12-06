{
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      bigfile.enabled = false;
      dashboard.enabled = false;
      explorer.enabled = false;
      indent.enabled = true;
      input.enabled = false;
      picker = {
        enabled = true;
      };
      notifier.enabled = false;
      quickfile.enabled = false;
      scope.enabled = false;
      scroll.enabled = false;
      statuscolumn.enabled = false;
      words.enabled = false;
      lazygit.enabled = false;
      image.enabled = false;
      terminal.enabled = false;
    };
  };
}
