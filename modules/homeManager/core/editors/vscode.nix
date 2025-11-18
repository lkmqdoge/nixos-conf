{pkgs, ...}: {
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.minimap.enabled" = false;
        "workbench.colorTheme" = "Dark Modern";
        "workbench.editor.pinnedTabsOnSeparateRow" = true;
        "window.density.editorTabHeight" = "compact";
        "workbench.editor.empty.hint" = "hidden";
        "workbench.activityBar.location" = "top";
        "editor.glyphMargin" = true;
        "editor.fontLigatures"= true;
        "editor.letterSpacing" = 0.7;
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "C_Cpp.inlayHints.parameterNames.suppressWhenArgumentContainsName" = false;
        "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
        "editor.inlayHints.enabled" = "off";
        "explorer.confirmDelete" = false;
      };

      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        github.github-vscode-theme

        bbenoist.nix
        mkhl.direnv

        # dotnet
        # csharpier.csharpier-vscode # formatter

        # c/c++
        ms-vscode.cpptools-extension-pack
        ms-vscode.cmake-tools
        twxs.cmake
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-avalonia";
          publisher = "AvaloniaTeam";
          version = "0.0.32";
          sha256 = "2OpZOltD+4i9tUmk0tTDDdEEhffCvHMAQ6BcsA+2Ou8=";
        }
      ];
    };
  };
}
