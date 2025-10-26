{
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      filesystem = {
      follow_current_file = {
        enabled = true;
        leave_dirs_open = true;
            hide_dotfiles = false;
            hide_gitignored = false;
            hide_by_pattern = [
              "*.import"
              "*.uid"
            ];
        };
      };
    };
  };
}
