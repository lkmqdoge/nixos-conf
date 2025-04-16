{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    pwvucontrol

    prismlauncher # minecraft launcher
    kitty # kibty :3
    xfce.thunar
    telegram-desktop
    firefox
    vim
    wireguard-tools
    unzip # archive manager
    vlc # media player
    feh # image viewer
    htop

    dig

    grc
    libnotify
    pkgs.dunst
    swww # wallpaper util
    wttrbar # thing for weather widget
    pkgs.grim #
    pkgs.slurp #
    pkgs.wl-clipboard # screenshot tool

    glib
    gcc
    gdb
    jdk
    go

    nasm
    fasm # assmembly

    protoc-gen-go # furry go code gen
    protobuf
    sqlc
    typescript
    nodejs_23
    typescript-language-server
    svelte-language-server
    tailwindcss-language-server

    dotnetCorePackages.dotnet_8.sdk
    csharp-ls

    aseprite
    krita
    vesktop # discord on wayland
    libreoffice # office programms
  ];
}
