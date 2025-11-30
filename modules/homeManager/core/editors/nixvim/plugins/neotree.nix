{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      source_selector = {
        winbar = false;
      };

      filesystem = {
        filtered_items = {
          visible = false;

          hide_dotfiles = true;
          hide_gitignored = true;
          hide_by_pattern = [
            "*.import"
            "*.uid"
          ];
        };

        follow_current_file = {
          enabled = true;
          leave_dirs_open = true;
        };
      };
    };
  };
}
