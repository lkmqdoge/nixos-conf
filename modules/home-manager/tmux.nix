{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
  };
}
