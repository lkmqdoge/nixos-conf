{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0; # change escape time for better fish vi mode
    shell = "${pkgs.fish}/bin/fish";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
      }
      {
        plugin = tmuxPlugins.prefix-highlight;
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }

    ];

    extraConfig = ''
      set-option -g pane-border-lines double
      set-option -g pane-border-indicators arrows
      set-option -g pane-border-status top
    '';
  };
}
