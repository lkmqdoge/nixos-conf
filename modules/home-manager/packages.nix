{pkgs, ...}: {
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    pwvucontrol
    ardour
    wireguard-tools
    prismlauncher     # minecraft launcher
    kitty             # kibty :3
    telegram-desktop
    firefox           # furryfox
    vim
    xfce.thunar       # i like thunar 
    unzip             # штука для архивов 
    vlc               # media player
    feh               # image viewer
    htop
    krita
    vesktop           # discord
    libreoffice       # office 
    audacity          # sound editor with graphical UI
    dig
    tokei             # count your code
    glib
    grc               # colorizer
    gcc
    gdb
    jdk
    go
    nasm              # assmembly
    fasm              # assmembly
    libnotify
    pkgs.dunst
    swww              # wallpaper util
    wttrbar           # thing for weather widget
    pkgs.grim         # things for screenshot
    pkgs.slurp        #
    pkgs.wl-clipboard # screenshot tool
    protoc-gen-go     # furry go code gen
    protobuf
    sqlc
    typescript
    nodejs_24
    typescript-language-server
    svelte-language-server
    tailwindcss-language-server
    dotnetCorePackages.dotnet_8.sdk
    csharp-ls

    # HATE THIS |
    #           V 
    #         aseprite
  ];
}
