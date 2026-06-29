{ pkgs, lib, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    corefonts
    vista-fonts
  ];

  home.activation = {
    copy-fonts-local-share = lib.hm.dag.entryAfter ["writeBoundary"] ''
      rm -rf ~/.local/share/fonts
      mkdir -p ~/.local/share/fonts
      cp ${pkgs.corefonts}/share/fonts/truetype/* ~/.local/share/fonts/
      cp ${pkgs.vista-fonts}/share/fonts/truetype/* ~/.local/share/fonts/

      chmod 544 ~/.local/share/fonts
      chmod 444 ~/.local/share/fonts/*
    '';
  };
}
