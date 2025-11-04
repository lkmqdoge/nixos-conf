{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "FishTank";
    settings = {
      cursor_trail = 1;
      mouse_hide_wait = -1.0;
    };
  };
}
