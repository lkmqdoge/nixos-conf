{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.fastfetch = {
    enable = true;

    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        {
          type = "command";
          key = "System Age";
          text = "system-age";
        }
        "break"
        "colors"
      ];
    };
  };
}
