{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    escapeTime = 50; # change escape time for better fish vi mode
    shell = "${pkgs.fish}/bin/fish";

    plugins = with pkgs; [

      tmuxPlugins.cpu
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
  };
}
