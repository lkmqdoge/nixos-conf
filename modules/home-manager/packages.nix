{pkgs, ...}: {
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    pwvucontrol
    wireguard-tools
    prismlauncher # minecraft launcher
    kitty # kibty :3
    telegram-desktop
    firefox # furryfox
    vim


    unzip # штука для архивов
    vlc # media player
    feh # image viewer
    htop
    krita
    vesktop # discord
    libreoffice # office
    audacity # sound editor with graphical UI
    dig
    git-lfs
    tokei # count your code
    w3m
    ventoy-full
    testdisk

    glib
    grc # colorizer
    gcc
    gdb
    jdk
    go
    nasm # assmembly
    fasm # assmembly

    libnotify
    pkgs.dunst
    swww # wallpaper util
    wttrbar # thing for weather widget
    pkgs.grim # things for screenshot
    pkgs.slurp #
    pkgs.wl-clipboard # screenshot tool


    protoc-gen-go # furry go code gen
    protobuf
    typescript
    nodejs_24
    dotnetCorePackages.dotnet_9.sdk
    gnumake
    cmake

    
    mysql84
    sqlc

    # reaper # daw
  ];
}
