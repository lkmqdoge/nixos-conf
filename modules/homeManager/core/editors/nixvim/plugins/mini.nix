{
  programs.nixvim.plugins = {
    mini-indentscope = {
      enable = true;
      settings = {
        draw = {
          delay = 0;
        };

        mappings = {
          object_scope = "";
          object_scope_with_border = "";
          goto_top = "";
          goto_bottom = "";
        };

        symbol = "|";
      };
    };

    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
