{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_escape_delay_ms 30
      set fish_greeting "When in doubt, fish! ><>"
    '';

    plugins = [
      { # colorizer
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      { # directory jumping 
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      { # promt
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      { # run bash things
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];

    shellAliases = {
      "c"   = "clear";
      "nv"  = "nvim";
      "nvl" = "nvim --listen 127.0.0.1:55432 .";
      "ndv" = "nix develop --command fish";
      "tm"  = "tmux";
      "tma" = "tmux attach";
    };
  };
}
