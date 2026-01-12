{
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      indent.enabled = true;
      picker.enabled = true;
      explorer.enabled = false;
      bigfile.enabled = false;
      dashboard.enabled = false;
      input.enabled = false;
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
