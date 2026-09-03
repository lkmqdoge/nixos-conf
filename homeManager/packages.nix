{ pkgs, ... }:
let 
  runDiscordWithProxy = (pkgs.writeShellScriptBin "runDiscordWithProxy" ''
    exec ${pkgs.vesktop}/bin/vesktop --proxy-server="socks5://127.0.0.1:1080" "$@"
  '');

  runDiscordWithProxyDesktop = pkgs.makeDesktopItem {
    name = "desktopproxy";
    desktopName = "VesktopProxy";
    startupWMClass = "vesktop";
    icon = "vesktop";
    genericName = "Vesktop";
    exec = "runDiscordWithProxy";
  };
in
{
  home.packages = with pkgs; [
    runDiscordWithProxy
    runDiscordWithProxyDesktop
    # gui apps
    prismlauncher     # minecraft launcher
    kitty             # terminal emulator
    telegram-desktop  # fuck this app
    feh               # image viewer
    pwvucontrol       # sound control
    peazip            # gui archive viewer
    qbittorrent
    mpv
    vlc
    obs-studio
    firefox
    vesktop 
    mcomix            # comic reader
    bruno             # ide for exploring api

    yt-dlp
    krita
    (writeTextFile {
      name = "krita-thumbnailer";
      destination = "/share/thumbnailers/kra.thumbnailer";
      text = ''
        [Thumbnailer Entry]
        Exec=sh -c "${unzip}/bin/unzip -p %i preview.png > %o"
        MimeType=application/x-krita;
      '';
    })

    # libreoffice       # piece of shit
    onlyoffice-desktopeditors
    pinta # simple image editor
    easyeffects
    # https://github.com/nix-community/nix-melt
    nix-melt # A TUI flake.lock viewer
    # https://github.com/utdemir/nix-tree
    nix-tree # A TUI to visualize the dependency graph of a nix derivation

    glib
    libnotify
    pamixer
    ffmpeg
    awww    # wallpapers
    wttrbar # show weather 

    ydotool

    grc   # colorizer
    delta # better git pager
    bat   # better cat

    grim 
    slurp 
    wl-clipboard 
  ];
}
