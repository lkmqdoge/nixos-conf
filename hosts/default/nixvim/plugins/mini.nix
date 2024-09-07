{
  programs.nixvim.plugins.mini = {
    enable = false;

    modules = {
      align = {};
      basics = {
        options.extra_ui = true;
      };
      clue = {};
      cursorword = {};
      doc = {};
      extra = {};
      indentscope = {};
      trailspace = {};
      misc = {};
      surround = {};
    };
  };
}
